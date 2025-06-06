Rails.application.routes.draw do
  get "pages/home"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    namespace :admin do
      resources :users
      resources :priorities
      resources :statuses
    end
    
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#home"

  resources :tickets do
    member do
      patch :soft_delete
      patch :restore
    end

    collection do
      get :archived
    end
  end

end
