Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root 'pages#home'
  end
  resources :restaurants, only: %i[index new create show] do
    resources :campaigns, only: %i[new create]
    resources :chatrooms, only: :index
    get "stats", to: "pages#stats"
  end
  resources :campaigns, only: %i[show update] do
    resources :campaigns_ambassadors, only: %i[create]
  end

  resources :campaigns_ambassadors, only: %i[show] do
    get :client_code
    get :ambassador_code
  end


  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
