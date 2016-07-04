class CommentsController < ApplicationController
	  #當表單送 POST 請求到 /posts/:post_id/comments/ 時，controller （Blorgh::CommentsController）要有 create action 來回應
		def create
 		   @post = Post.find(params[:post_id]) #這篇留言所屬的文章
 		   @comment = @post.comments.build(params.require(:comment).permit(:content))
 		   @comment.user = current_user 
 		    if @comment.save
 			 	redirect_to post_path(@post) #回到show action,即show頁面
 			else
 				render 'posts/show'
 			end
 	    end
	
end