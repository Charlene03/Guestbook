class UsersController < ApplicationController
	def show
 	    @user = User.find(params[:id])
 	end

	def new  #回傳建立新使用者登入表單
		@user = User.new 
 	end
 
 	def create #在controller中儲存資料，在create action中使用新增的User模型
 	   	@user = User.new(user_params) #新增時呼叫private裡user_params方法並指向@user變數 
 
 	    if @user.save #將資料存進資料庫
 		    flash[:notice]= "You have registered" #Flash是一個暫時的Hash，顯示一次後就會被清掉 
 			redirect_to root_path
 		else
 			render :new
 	    end
 	end
 
    private  #請見 Rails起步走 Ruby on Rails指南 (strong parameters安全機制)
 	  def user_params #user_params是 private方法
   		params.require(:user).permit(:name, :phone, :email, :password) #params.require需要(:model_name).permit允許(:欄位1, :欄位2)
 	  end
end


#10 :#flash訊息:flash是一個Hash，其中的鍵你可以自定，常用:notice、:warning或:error等。
 		    #notice: "u have registered" 這一行就是一個Flash訊息。
			#:notice現在是Flash這個Hash的一個key，而value是“u have registered"
			#只是Flash訊息不會自動顯示，我們必須要把它加入到主模板(layout)中，才可以讓每一個頁面都可以顯示Flash訊息。
			#編輯app/views/layouts/application.html.erb的body區塊