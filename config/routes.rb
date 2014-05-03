LiftClone::Application.routes.draw do

  get "/feed" => "users#index", as: :feed
  get "/users/:user_id/goals", to: 'goals#completed', as: :completed

  resource  :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index] do
    resources :goals, shallow: true
  end
  root 'sessions#new'


end