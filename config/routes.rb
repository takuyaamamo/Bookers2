Rails.application.routes.draw do
  # トップページをルートにするroot to: 'コントローラ#アクション'
  root to: 'toppage#top'

  # deviceでサインイン後のページをトップにしていする
  # root 'users#show'

  get 'toppage/top'
  # deviseを使用する際にはURLにusersを含む
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user_images, only: [:new, :create]
  resources :users, only: [:show]

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end
end
