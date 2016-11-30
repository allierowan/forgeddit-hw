class CommentsController < ApplicationController
  before_action :logged_in?, only: [:new, :create]
  before_action :authorized?, only: [:destroy, :edit, :update]

  def logged_in?
    flash[:danger] = "You must be logged in to complete that action"
    redirect_to new_session_path unless current_user
  end

  def authorized?
    flash[:danger] = "You are not the owner of that item"
    redirect_to "/" unless current_user == Comment.find(params["id"]).user
  end

  def new
    if current_user
      @comment = Comment.new()
      @share = Share.find(params["share_id"])
      render :new
    else
      @message = "You must be logged in to comment"
      render new_session_path
    end
  end

  def create
    @share = Share.find(params["share_id"])
    @comment = @share.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to share_comments_path
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params["id"])
    @share = @comment.share
  end

  def update
    @comment = Comment.find(params["id"])
    @share = @comment.share
    if @comment.update(comment_params)
      redirect_to share_comments_path
    else
      render :edit
    end
  end

  def index
    @share = Share.find(params["share_id"])
    @comments = @share.comments.reverse
  end

  def destroy
    Comment.find(params["id"]).destroy
    redirect_to share_comments_path
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
