Rails.application.routes.draw do
  get "producttype/show"
  resources :genders
  get "producttype/show/product_type_id=:id" => "producttype#show", :as => :producttype
  get "chart/index"
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
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
end
