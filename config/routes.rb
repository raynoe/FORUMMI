Forummi::Application.routes.draw do
  resources :categories


  devise_for :users

  root :to => 'home#index'

  resources :thread_forums do
    member { post :vote }
  end


end
