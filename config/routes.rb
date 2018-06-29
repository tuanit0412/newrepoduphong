Rails.application.routes.draw do
  resources :sizes
  get "chart/index"
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  get "men-:id-shoes" => "producttype#men", :as => :mentype
  get "Women-:id" => "producttype#women", :as => :womentype
  get "type-:id" => "producttype#typeall", :as => :typeall
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index", as: "home_index"
  resources :store
  resources :home
  resources :orders
  resources :line_items
  resources :carts
  resources :types

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products do
    get :who_bought, on: :member
  end
  get "men" => "gendertype#men", :as => :men
  get "women" => "gendertype#women", :as => :women
  get "men-new_arrivals" => "gendertype#mennew"
  get "women-new_arrivals" => "gendertype#womennew"
  get "sports" => "gendertype#sport"
  get "brands" => "gendertype#brand"
end
