class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	#此用法：memoization，如果已經有@current_user，就不需每次轉換頁面都要去資料庫裡找@current_user。
  	# 如果沒有@current_user的話，就執行User.find(params[:user_id])，前提是session[:user_id]已經存在。
  end 	

  def logged_in?
  	!!current_user  # 將current_user轉變成回傳boolean值
  end
end
