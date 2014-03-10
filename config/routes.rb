Valet::Application.routes.draw do

  root :to => "features#index"

  resources :users
  resources :features
  resources :relationships#, :only => [:create, :destroy]
  resources :links
  resources :attachments

end
