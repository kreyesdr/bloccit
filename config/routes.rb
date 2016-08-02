Rails.application.routes.draw do

  resources :labels, only: [:show]

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsored_posts, except: [:index]
  end

  resources :post, only: [] do
    resources :comments, only: [:create, :destroy]

    post '/up-vote' => 'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote

  end

  resources :advertisements

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  post 'users/confirmation' => 'users#confirmation'

  get 'about' => 'welcome#about'

  get 'faq' => 'welcome#faq'

  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update]
      resources :topics, only: [:index, :show]
    end
  end

end
