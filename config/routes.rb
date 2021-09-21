Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :jobs do
    resources :favorites, only: [:create, :destroy]
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
end
