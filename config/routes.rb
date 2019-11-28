Rails.application.routes.draw do
  root "foods#index"
  devise_for :users

  resources :foods do
    collection do
      get "search"
      get "more"
      get "top"
    end
    resources :good, only: [:create, :destroy]
  end

  resources :user, only: [:show] do
    get "good" => "user#good"
  end

end