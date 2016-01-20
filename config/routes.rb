Rails.application.routes.draw do
  devise_scope :user do
    root to: 'registrations#new'
  end
  devise_for :users, controllers:
  {
    registrations: "registrations"
  }
  resources :users
  get :check, to: 'users#check'
end
