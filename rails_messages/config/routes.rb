Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/create'

  resources :messages
end
