class Account < RelationalAuthModel
  include Authority::UserAbilities
  has_secure_password

  has_one :session

  validates :username, uniqueness: true
  validates :username, length: { minimum: 6}
  validates :password, length: { minimum: 8}
  # An overide method for the Knock gem - determines who to authenticate
  def self.from_token_request request
    username = request.params.fetch("auth", []).fetch("username")
    self.find_by username: username
  end

  # An overide method for the Knock gem - finds and validates the account
  def self.from_token_payload(payload)
    acc = self.find_by(guid: payload["sub"])
    return acc if acc && acc.valid_session?(payload)
    nil
  end

  # An overide method for the Knock gem - determines what gets set in the jwt
  def to_token_payload
    ses = set_session
    # We can put additional details in the jwt if needed
    {
      sub: guid,
      ses: session.try(:guid),
      exp: session.try(:expires_at).to_i
    }
  end

  # Doing this has the added benefit of only ever having one session for the account
  # Of course that means we need to track logins some other way
  def set_session
    ses = Session.find_or_create_by(
      account: self,
    )
    ses.update(expires_at: 10.minutes.from_now)
  end

  # Some validation against the stored session
  def valid_session?(payload)
    ses =   session
    ses && ses.expires_at > Time.now && ses.guid == payload["ses"]
  end

  # Used to return a new token on every request and reset the expires_at
  def update_session
    auth = Knock::AuthToken.new(payload: to_token_payload)
    auth.token
  end
end
