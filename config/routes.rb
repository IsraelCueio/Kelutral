Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',    
  }
  resources :reports
  resources :sections
  resources :lists
  resources :lessons
  resources :exercises
  resources :phrase_translations
  resources :word_translations
  resources :expressions
  resources :phrases
  resources :words
  resources :word_classes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
