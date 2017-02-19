class HomeController < ApplicationController
  def main
    render json: {message: "You have reached Spinit!"}
  end
end
