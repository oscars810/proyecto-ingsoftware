Rails.application.routes.draw do
  get 'match/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  # Administrador
  get 'administrar', to: 'admin#index'
  get 'aceptar_locales', to: 'admin#aceptar_locales'
  patch 'aceptar_locales/:id', to: 'admin#aceptar_local'
  get 'administrar_locales', to: 'admin#ver_locales'
  delete 'administrar_locales/:id', to: 'admin#eliminar_local'

  # Locales
  # Create
  get 'locales/new', to: 'locals#new' 
  post 'locals', to: 'locals#create'

  # Read
  get 'locales', to: 'locals#index'
  get 'locales/:id', to: 'locals#show', as: 'local'

  # Edit
  get 'locales/:id/edit', to: 'locals#edit', as: 'local_edit'
  patch 'locales/:id', to: 'locals#update'
  
  # Destroy
  delete 'locales/:id', to: 'locals#destroy'

  # Comunas
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

  # Gustos
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

  # Comentarios
  # Create
  get 'comentarios/new/:id', to: 'comentarios#new'
  post 'comentarios', to: 'comentarios#create'

  # Read
  get 'comentarios/index'
  get 'comentarios/show'
  get 'comentarios/edit'


  # Perfil
  # Create
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations'}

  # Read Usuarios
  get 'perfiles', to: 'perfil#index'
  get 'perfil/:id', to: 'perfil#show', as: :perfil

  # Update perfil
  get 'perfil/:id/edit', to: 'perfil#edit', as: :perfil_edit
  patch 'perfil/:id', to: 'perfil#update'
  put 'perfil/:id', to: 'perfil#update'

  # Delete perfil
  delete 'perfil/:id', to: 'perfil#destroy'

  #Match
  #Mostrar perfiles
  get 'match/:id', to: 'match#index', as: :match

  #Create match

end
