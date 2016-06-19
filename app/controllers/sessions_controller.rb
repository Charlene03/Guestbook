class SessionsController < ApplicationController
   def new
   end
 
   def create
      user = User.find_by(name: params[:name])
 
    if user && user.authenticate(params[:phone]) #先確認使用者存在
         session[:user_id] = user.id  # automatically log in after registration
         
         redirect_to root_path
     else
     	flash[:error] = "There is something wrong with your username or phone!"
       redirect_to login_path
     end
   end
 
   def destroy
     session[:user_id] = nil
     
     redirect_to root_path
   end
 
 end 