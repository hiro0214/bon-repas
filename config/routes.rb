Rails.application.routes.draw do
  root "foods#index"
  devise_for :users

  resources :foods
  get "mypage/:id" => "foods#mypage"
  get "search" => "foods#search"
  get "more/:id" => "foods#more"
  get "new_after" => "foods#new_after"
  get "update_after" => "foods#update_after"
  get "top" => "foods#top"
end
