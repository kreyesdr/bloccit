Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :advertisements

  resources :users, only: [:new, :create]

  post 'users/confirmation' => 'users#confirmation'

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
