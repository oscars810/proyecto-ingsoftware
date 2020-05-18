Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  # Administrador
  get 'admin', to: 'admin#index'
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

  scope '/admin' do
    resources :comunas, controller: 'communes'
    resources :gustos, controller: 'interests'
  end

  # Comentarios
  # Create
  get 'locales/comentarios/new/:id', to: 'comentarios#new'
  post 'comentarios', to: 'comentarios#create'

  # Read
  get 'comentarios', to: 'comentarios#index'

  # Delete
  delete 'comentarios', to: 'comentarios#destroy'

  # Perfil
  # Create
  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }

  # Read Usuarios
  get 'perfiles', to: 'perfil#index'
  get 'perfil/:id', to: 'perfil#show', as: :perfil

  # Update perfil
  get 'perfil/:id/edit', to: 'perfil#edit', as: :perfil_edit
  patch 'perfil/:id', to: 'perfil#update'
  put 'perfil/:id', to: 'perfil#update'

  # Delete perfil
  delete 'perfil/:id', to: 'perfil#destroy'

  # Match
  # Mostrar perfiles
  get 'match/:id', to: 'match#index', as: :match

  # Create match

  # MENUS
  # Create
  get 'menus/new/:idlocal', to: 'menus#new', as: :menus_new
  post 'menus', to: 'menus#create'

  # Edit
  get 'menus/:id/edit/:idlocal', to: 'menus#edit'
  patch 'menus/:id', to: 'menus#update', as: :menu

  # Update
  get 'menus/:id/edit', to: 'menus#edit', as: :menus_edit
  patch 'menus/:id/', to: 'menus#update'
  put 'menus/:id/', to: 'menus#update'

  # Destroy
  delete 'menus', to: 'menus#destroy'
end
