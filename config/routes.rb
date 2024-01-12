Rails.application.routes.draw do
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    root to: 'managements#show'
    resources :managements, only: [:edit]
    resources :users, only: [:index, :show, :edit]
    resources :posts, only: [:new, :index, :show,:edit]
  end
  
  scope module: :public do
    root to: 'homes#top'
    resources :posts, only: [:new, :create, :index, :show, :edit] do
      resources :bookmarks, only: [:index, :create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :follows, only: [:index]
    get 'users/my_page'
    resources :users, only: [:index, :show, :edit, :update]
    
    
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
