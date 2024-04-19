Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :customers, controllers: { sessions: 'devise/sessions', registrations: 'users/registrations' }

  namespace :admin do
    resources :products
  end

  root 'products#index'
  resources :products
  resources :products, only: [:show]
  resources :products, only: [:index]
  resources :products do
    collection do
      get 'search'
    end
  end
  resources :categories

  resources :categories, only: [:show] do
    get 'products', to: 'products#show_by_category'
  end

  resources :products do
    collection do
      get :search
    end
  end

  resources :orders, only: [:create, :show]

  get 'about_us', to: 'about_pages#show', as: 'about_us'
  get 'contact_us', to: 'contact_pages#show', as: 'contact_us'
  get '/products/list', to: 'products#list', as: 'list_products'
  get '/categories/:category_id', to: 'products#show_by_category', as: 'products_by_category'
  get '/sale', to: 'products#index', sale: true
  get '/recent_updates', to: 'products#index', recent_updates: true
  get 'products/sale', to: 'products#sale', as: :sale_products
  get 'products/recent_updates', to: 'products#recent_updates', as: :recent_updates_products
  get 'user_info', to: 'orders#user_info', as: "user_info"
 
  # resource :cart, only: [:show, :update, :destroy]

  # resources :products do
  #   member do
  #     post 'add_to_cart'
  #   end
  # end

  # resources :products do
  #   post :add_to_cart, on: :member
  # end

  resource :cart, only: [:show] do
    put    :add_item
    delete :remove_item
    delete :remove_product
  end

  # Your other routes go here
  #resources :contact_pages, only: [:show]
  #resources :about_pages, only: [:show]

end