Valet::Application.routes.draw do

  root :to => "features#index"

  resources :users
  resources :features
  resources :relationships, :only => [:create, :destroy]

end
