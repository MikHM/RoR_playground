# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :toggle_status]
  http_basic_authenticate_with name: 'admin', password: 'pswadmin', except: %i[index show]

  def index
    @posts = Post.all
  end

  def show
    # TODO: undefined method `new_record?' for nil:NilClass
    #@comment = @post.comments.build if @post.comments.last.new_record?
  end

  def new
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  def toggle_status
    if @post.draft?
      @post.published!
    elsif @post.published?
      @post.draft!
    end

    redirect_to edit_post_path, notice: "Post's status has been updated."
  end

  private

  def post_params
    params.require(:post).permit( :title, 
                                  :body, 
                                  :author, 
                                  :topic_id)
  end

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end
