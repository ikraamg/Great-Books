Rails.application.routes.draw do
  resources :books do
    resources :votes, only: [:create, :destroy] 
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'books#index'

  get '/category' => 'books#category', :as => :category_display

end
