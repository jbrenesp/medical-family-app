Rails.application.routes.draw do
  get "doctor_visits/show"
  get "doctor_visits/new"
  get "doctor_visits/create"
  get "doctor_visits/edit"
  get "doctor_visits/update"
  get "doctor_visits/destroy"
  devise_for :users
  resources :families, only: [ :show, :new, :create, :edit, :update, :destroy ] do
    resources :family_members, only: [ :show, :new, :create, :edit, :update, :destroy ] do
      resources :illnesses, only: [ :show, :new, :create, :edit, :update, :destroy ]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "rails/welcome#index"

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
