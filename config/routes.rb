Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :spots, only: [:new, :create, :index, :show, :edit, :update]
end
