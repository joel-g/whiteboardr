Rails.application.routes.draw do

  resources :challenges, only: [:index, :create, :new, :show]
  resources :interviews, only: [:index, :new, :create, :show] do
    resources :feedbacks, only: [:create]
  end

  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

  root to: 'interviews#index'

end
