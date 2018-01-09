class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]
  http_basic_authenticate_with name: 'admin', password: 'pswadmin', only: [:destroy]

  def create
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(@post)
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to post_path(@post)
  end


  private

  def comment_params
    params.require(:comment).permit(:user_name, :message)
  end

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end
end
