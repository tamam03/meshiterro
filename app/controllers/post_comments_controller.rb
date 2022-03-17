class PostCommentsController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id
    # を省略して
    comment = current_user.post_comments.new(post_comment_params)
    # 一文で書ける
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end


end
