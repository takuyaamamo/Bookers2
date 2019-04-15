class ApplicationController < ActionController::Base
  # deviseコントローラーの修正はここに書く
  # nameカラムを追加したため修正が必要となった
  # deviseを実行する前に:configure_permitted_parametersを呼び出し
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # deviseでストロングパラメータを追加する追加しないとPOSTに反映されない？
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
