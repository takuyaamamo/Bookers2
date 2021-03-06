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
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:introduction,:image])
  end

# deviseはデフォルト設定でログイン後トップページに飛んでしまう。トップページを設定している場合変更は出来ない。よって以下の設定を行う
  def after_sign_in_path_for(resource)
    # ここに何か記入すれば出るかも
    flash[:notice] = 'ログイン成功！！successfully'
    user_path(current_user.id)
  end

  def after_sign_up_path_for(resource)
    flash[:notice] = 'ログイン成功！！successfully'
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = 'ログアウト成功！！successfully'
    root_path
  end
end
