Rails.application.routes.draw do
  # トップページをルートにするroot to: 'コントローラ#アクション'
  root to: 'toppage#top'
  
  get 'toppage/top'
  # deviseを使用する際にはURLにusersを含む
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
