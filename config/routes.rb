Dc::Application.routes.draw do
  get "panel/customer"

  get "panel/domain"

  get "panel/reseller"

  get "panel/order"

  get "panel/contact"

  #resources :payment_notifications

  get "pro/buy"

  resources :registrars

  get "user/login"

  get "user/logout"

  get "user/create"

  get "user/update"

  get "shelf/index"

  get "domain/check"

  get "serve/index"

  resources :endings


  resources :shelves
  
  match 'api/domains/related_words' => 'api/domain#related_words', via: [:get, :post]
  match 'api/domains/check' => 'api/domain#check', via: [:get, :post]
  match 'api/domains/endings' => 'api/domain#endings', via: [:get, :post]
  
  
  match 'api/shelves/create' => 'api/shelf#create', via: [:get, :post]
  match 'api/shelves/destroy' => 'api/shelf#destroy', via: [:get, :post]
  match 'api/shelves/' => 'api/shelf#index', via: [:get, :post]
  match 'api/shelves/add' => 'api/shelf#add', via: [:get, :post]
  match 'api/shelves/remove' => 'api/shelf#remove', via: [:get, :post]
  match 'api/shelves/accesses' => 'api/shelf#accesses', via: [:get, :post]
  match 'api/shelves/give_access' => 'api/shelf#give_access', via: [:get, :post]
  
  
  match 'api/users/sign_up' => 'api/user#signup', via: [:get, :post]
  match 'api/users/update' => 'api/user#update', via: [:get, :post]
  match 'api/users/sign_in' => 'api/user#login', via: [:get, :post]
  match 'api/users/sign_out' => 'api/user#logout', via: [:get, :post]
  match 'api/users/notifications' => 'api/user#notifications', via: [:get, :post]
  
  match 'api/analytics' => 'api/domain#push_to_analytics', via: [:get, :post]
  
  match 'payment_notifications' => 'payment_notifications#create', via: [:get, :post]
  
  match 'developers' => 'serve#developers', via: [:get, :post]
  match 'contact' => 'serve#contact', via: [:get, :post]
  match 'about' => 'serve#about', via: [:get, :post]
  
  resources :pro
  devise_for :users
  
  root :to => 'serve#index'
end
