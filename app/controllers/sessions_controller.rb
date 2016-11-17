class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.password == params[:password]
      session["current_user_id"] = @user.id
      redirect_to shares_path
    else
      @message = "You username or password was not correct"
      render :new
    end
  end

  def destroy
    session.delete("current_user_id")
    redirect_to shares_path
  end
end
