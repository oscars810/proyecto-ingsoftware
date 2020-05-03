Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  #Locales
  #Create
  get 'locales/new', to: 'locals#new' 
  post 'locals', to: 'locals#create'

end
