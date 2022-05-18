Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/items', to: 'items#index'
  post '/items', to: 'items#create'
  get '/item/new', to: 'items#new'
  post '/items', to: 'items#create'
  post '/item/:id', to: 'items#update'
  get '/item/:id/edit', to: 'items#edit'
  delete '/item/:id/delete', to: 'items#destroy'
end
