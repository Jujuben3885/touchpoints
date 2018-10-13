Rails.application.routes.draw do
  resources :forms
  resources :submissions, except: [:new, :index, :create]
  resources :touchpoints do
    member do
      get "js", to: "touchpoints#js", as: :js
      get "example", to: "touchpoints#example", as: :example
    end
    resources :forms
    resources :submissions, only: [:new, :show, :index, :create]
  end
  devise_for :users
  namespace :admin do
    resources :users
    resources :organizations
    root to: "site#index"
  end
  get "status", to: "site#status", as: :status
  root to: "site#index"
end
