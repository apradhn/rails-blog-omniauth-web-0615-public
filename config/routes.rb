RailsBlog::Application.routes.draw do

  root 'posts#index'
  get '/auth/:provider/callback' => "sessions#create"
  get '/login' => "sessions#new"
  
  resources :sessions
  resources :users, :only => [:new, :show, :index]
  resources :tags, :only => [:show, :index]
  
  resources :posts do 
    resources :comments, :only => [:new, :create]
  end

end
