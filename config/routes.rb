Rails.application.routes.draw do
  devise_for :users
  resources :tile_sets do
    resources :tiles, only: [:create, :destroy]
  end
end
