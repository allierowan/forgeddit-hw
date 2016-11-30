class SharesController < ApplicationController
  before_action :logged_in?, only: [:new, :create]
  before_action :authorized?, only: [:destroy, :edit, :update]

  def logged_in?
    flash[:danger] = "You must be logged in to complete that action"
    redirect_to new_session_path unless current_user
  end

  def authorized?
    flash[:danger] = "You are not the owner of that item"
    redirect_to "/" unless current_user == Share.find(params["id"]).user
  end

  def new
    if current_user
      @share = Share.new()
      render :new
    else
      @message = "You must be logged in to create a post"
      @shares = Share.all.reverse
      render new_session_path
    end
  end

  def create
    @user = current_user
    @share = @user.shares.build(share_params)
    if @share.save
      redirect_to shares_path, flash: { success: "Share was successful" }
    else
      render :new
    end
  end

  def index
    @shares = Share.all.reverse
  end

  def destroy
    if current_user
      Share.find(params["id"]).destroy
      redirect_to shares_path
    else
      @message="You must log in to delete content"
    end
  end

  def edit
    @share = Share.find(params["id"])
  end

  def update
    @share = Share.find(params["id"])
    if @share.update(share_params) && @share.user == current_user
      redirect_to shares_path
    else
      @message = "You are not logged in as the owner of this post"
    end
  end

  def user_shares
    @user = User.find(params["user_id"])
    @shares = @user.shares.reverse
  end

  def share_params
    params.require(:share).permit(:title, :url)
  end
end
