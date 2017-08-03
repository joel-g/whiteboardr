Rails.application.routes.draw do

  resources :password_resets, except: [:destroy, :show]
  resources :challenges, only: [:index, :create, :new, :show]
  resources :interviews, except: [:destroy, :edit] do
    resources :feedbacks, only: [:create,:edit,:update]
  end
  resources :users, except: [:destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :faqs, only: [:index]

  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  get 'faq' => 'faqs#index'

  post 'i' => 'interviews#find'
  get 'i' => 'interviews#find'

  root to: 'interviews#index'

end
