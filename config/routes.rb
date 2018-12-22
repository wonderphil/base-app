Rails.application.routes.draw do
  
  root 'pages#home'
  
  get   'contact',          to: 'messages#new'
  post  'contact',          to: 'messages#create'
  # get 'contact',          to: 'messages#new'
  # post 'contact',         to: 'messages#create'
  #get 'contact',          to: 'pages#contact'
  get   'about_us',         to: 'pages#about_us'
  get   'privacy',          to: 'pages#privacy'
  
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
end
