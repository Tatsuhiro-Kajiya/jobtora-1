Rails.application.routes.draw do
  get 'users/index'
  devise_for :users 
  devise_scope :user do 
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "spots#index"
  resources :spots do
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
