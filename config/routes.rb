Rails.application.routes.draw do
  devise_for :users
  root 'topics#index'
  resources :topics
  post 'posts/create', to: 'posts#create'
end
