Rails.application.routes.draw do
  resources :listings

  resources :listings do
    resources :reservations
  end

  resources :payments, only: [:create, :new]

  get "static_pages/home"

  get "static_pages/about"

  resources :passwords, controller: "passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users, only: [:show, :edit, :update, :destroy]

  root "static_pages#home"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  get "/search", to: "search#search"
end
