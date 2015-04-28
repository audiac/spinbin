Spinbin::Application.routes.draw do

  root 'welcome#index'

  get '/register', to: 'users#new'

  resources :users, only: [:show, :create, :edit, :update]

end
