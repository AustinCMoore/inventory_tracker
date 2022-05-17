Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/items', to: 'items#index'
  post '/items', to: 'items#create'
  get '/items/new', to: 'items#new'
  post '/items', to: 'items#create'
  post '/items/:id', to: 'items#update'
  get '/items/:id/edit', to: 'items#edit'
end
