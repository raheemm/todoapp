Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tasks#index'
  resources :tasks

  post '/done/:id', to: 'tasks#done', as: 'done'
  get '/done/:id', to: 'tasks#index'

  post '/undo/:id', to: 'tasks#undo', as: 'undo'
  get '/undo/:id', to: 'tasks#index'

  get 'signup', to: 'users#new'
  resources :users, except: [:new]

end
