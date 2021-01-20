Rails.application.routes.draw do
  get 'spots/index'
  root to: "spots#index"
end
