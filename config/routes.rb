Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }

  resources :users do
    resources :posts do
      resources :comments
    end
    resources :follows, only: [:create]
  end

  resources :follows, only: [:destroy]
  #Página principal
  root to: 'pages#index'
end
