Rails.application.routes.draw do
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'homes#top'
    resources :managements, only: [:edit]
    resources :users, only: [:index, :show, :edit, :update]
    resources :posts, only: [:new, :index, :show,:edit]
  end
  
  scope module: :public do
    root to: 'homes#top'
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :bookmarks, only: [:index, :create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    get 'users/my_page'
    patch 'users/quit'
    resources :users, only: [:index, :show, :edit, :update] do
      resources :follows, only: [:create, :destroy]
        get "followings" => "follows#followings", as: "followings"
        get "followers" => "follows#followers", as: "followers"
    end
    get "search" => "searchs#search"
    
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
