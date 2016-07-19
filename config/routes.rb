Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :post, only: [] do
    resources :comments, only: [:create, :destroy]
  end

  resources :advertisements

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  post 'users/confirmation' => 'users#confirmation'

  get 'about' => 'welcome#about'

  get 'faq' => 'welcome#faq'

  root 'welcome#index'
end
