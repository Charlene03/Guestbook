class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def show #秀出單筆資料
		
		@post = Post.find(params[:id]) #index 頁面點擊 show 的文章連結，就會前往如 http://localhost:3000/posts/1 的網址。 Rails 會針對這個 resource 去呼叫 show action，然後傳進 1 到 id 參數。
		@comment = Comment.new
		@comments = @Post.comments
	end
end

  #Post.all 所有的post資料抓出來
  #@posts 丟到實例變數,才能把變數傳到view(前端)。Rails讓action裡的實例變數通通傳到vies樣板裡可以使用 >>定義完，到index.html.erb編輯
  #註 @instance variable可以在同一個class的各種method之間互相傳遞