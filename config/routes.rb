Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :spots do
    resources :comments, only: [:create]
  end
end
