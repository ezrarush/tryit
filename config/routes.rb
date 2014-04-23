Tryit::Application.routes.draw do
  get 'menu_items/index'

  get 'menu_items/show'

  resources :menus do 
    resources :menu_items
  end
  
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
