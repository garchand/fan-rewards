Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :restaurants, only: %i[index new create show] do
    resources :campaigns, only: %i[new create]
  end
  resources :campaigns, only: %i[show update] do
    resources :campaigns_ambassadors, only: %i[create]
  end
  get "stats", to: "pages#stats"
end
