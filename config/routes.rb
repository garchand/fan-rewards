Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :restaurants, only: %i[index new create show] do
    resources :campaigns, only: %i[index new create show destroy]
  end
end
