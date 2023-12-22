Rails.application.routes.draw do
  
  namespace :admin do
    root to: 'managements#show'
    resources :managements, only: [:edit]
    resources :users, only: [:index, :show, :edit]
    resources :posts, only: [:new, :index, :show,:edit]
  end
  
  scope module: :public do
    root to: 'homes#top'
    resources :bookmarks, only: [:index]
    resources :posts, only: [:new, :index, :show, :edit]
    resources :follows, only: [:index]
    resources :users, only: [:index, :show, :edit]
  end
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
