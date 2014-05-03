LiftClone::Application.routes.draw do

  get "comments/new"
  get "comments/create"
  get "comments/destroy"
  get "/feed" => "users#index", as: :feed
  get "/users/:user_id/goals", to: 'goals#completed', as: :completed

  resource  :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index] do
    resources :goals, shallow: true
  end
  resources :comments, only: [:create, :destroy]
  root 'sessions#new'


end