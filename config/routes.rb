Rails.application.routes.draw do
  # get 'messages/index'
  root 'chatroom#index'
  # post 'signup', to: 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  post 'message', to: 'messages#create'
  get 'users', to: 'sessions#show'

  mount ActionCable.server, at: '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
