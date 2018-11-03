Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/contact'
  get 'pages/about_us'
  get 'pages/privacy'
  
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  
end
