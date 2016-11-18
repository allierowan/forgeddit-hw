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
  end

  def index
    @share = Share.find(params["share_id"])
    @comments = @share.comments
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
