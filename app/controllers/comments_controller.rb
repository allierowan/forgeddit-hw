class CommentsController < ApplicationController
  def new
    @comment = Comment.new()
    @share = Share.find(params["share_id"])
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
    @comments = @share.comments
  end

  def destroy
    Comment.find(params["id"]).destroy
    redirect_to share_comments_path
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
