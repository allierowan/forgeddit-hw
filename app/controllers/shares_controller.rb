class SharesController < ApplicationController
  def new
    if current_user
      @share = Share.new()
      render :new
    else
      @message = "You must be logged in to create a post"
      @shares = Share.all.reverse
      render :index
    end
  end

  def create
    @user = current_user
    @share = @user.shares.build(share_params)
    if @share.save
      redirect_to shares_path
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
    @shares = current_user.shares.reverse
  end

  def share_params
    params.require(:share).permit(:title, :url)
  end
end
