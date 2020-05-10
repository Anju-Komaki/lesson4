Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :travel_images, only:[:new, :create, :index, :show, :destroy, :edit] do
  	resource :comments, only:[:create, :destroy]
  	resource :favorites, only:[:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :index] do
    member do
      get :follower, :followed
    end
  end

  post 'follow/:id' => 'relationships#create', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#destroy', as: 'unfollow' # フォロー外す

  get 'home/about' => 'home#about', as: 'about'

end