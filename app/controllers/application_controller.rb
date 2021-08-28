class ApplicationController < ActionController::Base
   
before_action :authenticate_user!,except: [:top]

#devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行。
before_action :configure_permitted_parameters, if: :devise_controller?
# 投稿一覧画面を作成したので、ログイン後は投稿一覧画面に遷移するように修正。
def after_sign_in_path_for(resource)
   post_images_path
end

protected

#ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可

def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end

end
