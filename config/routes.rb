Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root 'devise/sessions#new'
  end
  resources :restaurants, only: %i[index new create show] do
    resources :campaigns, only: %i[new create]
    resources :chatrooms, only: :index
  end
  resources :campaigns, only: %i[show update] do
    resources :campaigns_ambassadors, only: %i[create]
  end
  get "stats", to: "pages#stats"

resources :chatrooms, only: :show do
  resources :messages, only: :create
end
end
