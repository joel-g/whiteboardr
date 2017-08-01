Rails.application.routes.draw do

# delete when done
  get 'password_resets/create'
  get 'password_resets/edit'
  get 'password_resets/update'

  resources :password_resets

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
