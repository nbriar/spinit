Rails.application.routes.draw do
  resources :people
  resources :account_token, only: :create
  resources :accounts
  resources :people, only: :index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#main'

  get '/docs' => redirect('/swagger/dist/index.html?url=/docs/api-docs.json')
end
