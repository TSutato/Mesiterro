class PostCommentsController < ApplicationController

# コメント投稿だけの一覧画面や投稿画面は作成せず、その代わり、投稿画像の詳細画面（/post_image/:id/）にコメント投稿機能を実装。

def create
  post_image = PostImage.find(params[:post_image_id])
  comment = current_user.post_comments.new(post_comment_params)
  comment.post_image_id = post_image_id
  comment.save
  redirect_to post_image_path(post_image)
 
end

def destroy
   PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
   redirect_to post_image_path(params[:post_image_id])

end

private

 def post_comment_params
    params.require(:post_comment).permit(:comment)
 end

  
end
