Rails.application.routes.draw do

  resources :advertisements

  resources :posts

  resources :questions

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
