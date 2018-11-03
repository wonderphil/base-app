Rails.application.routes.draw do
  
  root 'pages#home'
  get 'pages/contact'
  get 'pages/about_us'
  
  devise_for :users
  # Rails.application.routes.draw do
  #   devise_for :users, controllers: {
  #     sessions: 'users/sessions'
  #   }
  # end
end
