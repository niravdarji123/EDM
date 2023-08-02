Rails.application.routes.draw do
  root to: 'dashboard#index'
  post '/send_email', to: 'dashboard#send_email'
  resource :sessions, only: [:new, :create]
  post '/sendgrid_notification', to: 'webhooks#sendgrid_notification'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
