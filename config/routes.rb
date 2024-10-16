Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # the below block makes the reg page only accessibly via a subdomain, so its reached like this reg.crashcon.com
  devise_for :users # devise gem auto sets up needed routes for user login
  constraints subdomain: "reg" do
    resources :con_registrations
    root "reg#index", as: :reg_root
  end

  constraints subdomain: "admin" do
    root "admin/admin#index", as: :admin_root
    resources :con_registrations
    resources :search, only: [ :index ], controller: "admin/search"
  end

  root "home#index"
  # root must be under constraints or they wont get loaded
  # The default page and action to load when the site is reached like this www.crashcon.com
  # root to: "home#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
