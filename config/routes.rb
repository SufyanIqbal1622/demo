Rails.application.routes.draw do
    devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  root 'home#index'

  resources :posts do
    resources :comments
  end

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
end
