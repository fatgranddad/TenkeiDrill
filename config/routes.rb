Rails.application.routes.draw do
  root 'tiles#index'  # これをルートページとして設定
  resources :tiles, only: [:index]  # 必要に応じて他のアクションを追加
end
