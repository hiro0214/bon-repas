Rails.application.routes.draw do
  root "foods#index"
  devise_for :users

  resources :foods do
    resources :good, only: [:create, :destroy]
  end

  resources :user, only: [:show] do
    get "good" => "user#good"
  end

  get "search" => "foods#search"
  get "more" => "foods#more"
  get "top" => "foods#top"

end