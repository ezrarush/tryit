Tryit::Application.routes.draw do

  
  get 'menus/:id/tags/:tag', to: 'menus#show', as: :tag
  
  resources :menu_items
  
  resources :menus do 
    resources :menu_items
  end
  
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
