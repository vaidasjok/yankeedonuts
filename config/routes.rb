Rails.application.routes.draw do


  resources :product_categories
  mount Ckeditor::Engine => '/ckeditor'
  resources :pages, param: :slug
  resources :products

  get 'sessions/new'

  get  '/registruotis',  to: 'users#new'

  get '/our-work', to: 'static_pages#our_work'
  get '/kaip-tai-veikia', to: 'static_pages#kaip_tai_veikia'
  get '/contact', to: 'static_pages#contact'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/send-mail', to: 'pages#send_mail'
  resources :users


  resources :galleries
  resources :photos

  root :to => "static_pages#home"
  get '/:slug', to: 'pages#show_pages', as: 'puslapis'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
