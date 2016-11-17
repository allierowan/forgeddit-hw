class SharesController < ApplicationController
  def new
    @share = Share.new()
  end

  def create
    @share = Share.new(share_params)
    if share.save
      redirect_to :index
    else
      render :new
    end
  end

  def index
    @shares = Share.all
  end

  def edit
  end
end
