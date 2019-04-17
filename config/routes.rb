Rails.application.routes.draw do
  get 'books/create'
  get 'books/update'
  get 'books/delete'
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
  resources :books

end
