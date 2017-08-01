Rails.application.routes.draw do

  resources :password_resets, except: [:destroy, :show]
  resources :challenges, only: [:index, :create, :new, :show]
  resources :interviews, except: [:destroy, :edit] do
    resources :feedbacks, only: [:create]
  end
  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'

  root to: 'interviews#index'

end
