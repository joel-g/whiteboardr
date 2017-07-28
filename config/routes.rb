Rails.application.routes.draw do

  resources :challenges, only: [:create, :new]
  resources :interviews, only: [:index, :new, :create, :show] do
    resources :feedbacks, only: [:create]
  end

  resources :users

end
