class SharesController < ApplicationController
  def new
    @share = Share.new()
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
    @shares = Share.all
  end

  def destroy
    if current_user
      Share.find(params["id"]).destroy
      redirect_to :index
    else
      @message="You must log in to delete content"
    end
  end

  def edit
    @share = Share.find(params["id"])
    if @share.udpate(share_params) && @share.user == current_user
      redirect_to :index
    else
      @message = "You are not logged in as the owner of this post"
    end
  end

  def share_params
    params.require(:share).permit(:title, :url)
  end
end
