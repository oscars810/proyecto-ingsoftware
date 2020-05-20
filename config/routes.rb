Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  # Administrador
  get 'admin', to: 'admin#index'
  get 'aceptar_locales', to: 'admin#aceptar_locales'
  patch 'aceptar_locales/:id', to: 'admin#aceptar_local'
  get 'administrar_locales', to: 'admin#ver_locales'
  delete 'administrar_locales/:id', to: 'admin#eliminar_local'

  scope '/admin' do
    resources :comunas, controller: 'communes'
    resources :gustos, controller: 'interests'
  end

  # Locales y Menus
  resources :locales, controller: 'locals', as: 'local' do
    resources :menus
  end

  # Comentarios
  # Create
  get 'locales/comentarios/new/:id', to: 'comments#new'
  post 'comentarios', to: 'comments#create'

  # Read
  get 'comentarios', to: 'comments#index'

  # Delete
  delete 'comentarios', to: 'comments#destroy'

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
  get 'match/:id', to: 'matches#index', as: :match

  # Create match
end
