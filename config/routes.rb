Rails.application.routes.draw do
  # get 'users/new'
  # get 'pages/home'
  # get 'pages/contact'
  # get 'pages/about'
  # get 'pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/contact', :to => 'pages#contact'
  get '/about', :to => 'pages#about'
  get '/help', :to => 'pages#help'
  root :to => 'pages#home'
  get '/signup', :to => 'users#new'
end
