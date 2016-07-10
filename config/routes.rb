Rails.application.routes.draw do
  scope :module => 'web' do
    root 'users#index'

    get 'login', to: 'session#new'
    post 'login', to: 'session#create'
    get 'logout', to: 'session#destroy'

    get 'register', to: 'users#new'
    post 'register', to: 'users#create'

    get 'confirm', to: 'users#confirm'

    resources :users, only: [:show]

    namespace :admin do
      get '/', to: 'tasks#index'

      resources :users
      resources :tasks
    end
  end
end
