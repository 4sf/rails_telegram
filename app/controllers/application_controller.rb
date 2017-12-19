class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # 모든 컨트롤러가 발동되기 이전에
  # 유저가 접속되어 있는지 확인한다.

  def authorize #로그인 되었는지 판별해라
    redirect_to '/users/login' unless current_user
  end
  # helper_method :current_user
end
