Rails.application.routes.draw do
  resources :tiles, only: [:index] 
end
