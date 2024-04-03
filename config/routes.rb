# Rails.application.routes.draw do
  #devise_for :customers
#   devise_for :admin_users, ActiveAdmin::Devise.config
#   ActiveAdmin.routes(self)
#   get 'admins/login', to: 'admins#login_form', as: 'login_admins'
#   post 'admins/login', to: 'admins#login'
#   resources :admins, only: [:new, :create]
# end
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #devise_for :customers
  devise_for :customers, controllers: { sessions: 'sessions', registrations: 'users/registrations' }

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

  resources :products do
    collection do
      get :search
    end
  end

  get 'about_us', to: 'about_pages#show', as: 'about_us'
  get 'contact_us', to: 'contact_pages#show', as: 'contact_us'
  get '/categories/:category_id', to: 'products#show_by_category', as: 'products_by_category'
  get '/sale', to: 'products#index', sale: true
  get '/recent_updates', to: 'products#index', recent_updates: true
  get 'products/sale', to: 'products#sale', as: :sale_products
  get 'products/recent_updates', to: 'products#recent_updates', as: :recent_updates_products
\

  # Your other routes go here
  #resources :contact_pages, only: [:show]
  #resources :about_pages, only: [:show]

end