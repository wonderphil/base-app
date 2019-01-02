Rails.application.routes.draw do

  root 'pages#home'
  
  get   'contact',          to: 'messages#new'
  post  'contact',          to: 'messages#create'
  get   'about_us',         to: 'pages#about_us'
  post  'about_us',         to: 'pages#create_job'
  get   'privacy',          to: 'pages#privacy'
  
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }

  resources :profiles,  only: [:show, :update ]
  
end
