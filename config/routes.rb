Rails.application.routes.draw do
  root 'topics#index'
  resources :topics
  post 'posts/create', to: 'posts#create'
end
