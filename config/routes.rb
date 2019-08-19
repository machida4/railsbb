Rails.application.routes.draw do
  root 'topics#index'
  get 'topics/index'
  get 'topics/show'
  get 'topics/new'
  post 'topics/create'
end
