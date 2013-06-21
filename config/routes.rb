Forummi::Application.routes.draw do
 
  resources :categories
  match "profile" => "users#show"
  

  devise_for :users do
  	 resources :profiles
  end
  


  root :to => 'home#index'

  resources :thread_forums do
    member { post :vote }
    resources :comments
  end


end
