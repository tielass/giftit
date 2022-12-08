Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: "gifts#index"
  resources :events do
    resources :wishlistgifts, only: %i[index create show]
  end
  resources :wishlistgifts, only: %i[] do
    resources :votings, only: %i[create show]
  end
  resources :votings, only: %i[destroy]
  resources :chatrooms, only: %i[show index] do
    resources :messages, only: :create
  end
  resources :gifts
  get "/profile", to: "pages#profile"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
