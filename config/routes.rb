Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/update'
  # トップページをルートにするroot to: 'コントローラ#アクション'
  root to: 'toppage#top'

  # deviceでサインイン後のページをトップにしていする
  # root 'users#show'

  get 'toppage/top'
  # deviseを使用する際にはURLにusersを含む
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user_images, only: [:new, :create, :show]
  resources :users
  resources :posts

end
