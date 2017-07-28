Rails.application.routes.draw do

  resources :challenges, only: [:create, :new]
  resources :interviews, only: [:new, :create, :show] do
    resources :feedbacks, only: [:create]
  end

  resources :users, only: [:new, :create, :show]

  resources :sessions, only: [:new, :create, :destroy]

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'


end
