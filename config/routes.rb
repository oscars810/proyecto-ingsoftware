Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  
  #Locales
  #Create
  get 'locales/new', to: 'locals#new' 
  post 'locals', to: 'locals#create'
  
  # CRUD de Comunas
  # Create
  get 'comunas/new', to: 'comunas#new'
  post 'comunas', to: 'comunas#create'

  # Read
  get 'comunas', to: 'comunas#index'
  get 'comunas/:id', to: 'comunas#show', as: :comuna

  # Update
  get 'comunas/:id/edit', to: 'comunas#edit', as: :comunas_edit
  patch 'comunas/:id/', to: 'comunas#update'
  put 'comunas/:id/', to: 'comunas#update'

  # Destroy
  delete 'comunas/:id', to: 'comunas#destroy'

  # CRUD de Gustos
  # Create
  get 'gustos/new', to: 'gustos#new'
  post 'gustos', to: 'gustos#create'

  # Read
  get 'gustos', to: 'gustos#index'
  get 'gustos/:id', to: 'gustos#show', as: :gusto

  # Update
  get 'gustos/:id/edit', to: 'gustos#edit', as: :gustos_edit
  patch 'gustos/:id/', to: 'gustos#update'
  put 'gustos/:id/', to: 'gustos#update'

  # Destroy
  delete 'gustos/:id', to: 'gustos#destroy'

end
