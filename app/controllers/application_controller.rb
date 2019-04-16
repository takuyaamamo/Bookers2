class ApplicationController < ActionController::Base
  # deviseコントローラーの修正はここに書く
  # nameカラムを追加したため修正が必要となった
  # deviseを実行する前に:configure_permitted_parametersを呼び出し
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # 新規登録時とログイン時にdeviseでストロングパラメータを追加する.追加しないとPOSTに反映されない
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

# deviseはデフォルト設定でログイン後トップページに飛んでしまう。トップページを設定している場合変更は出来ない。よって以下の設定を行う
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_up_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
