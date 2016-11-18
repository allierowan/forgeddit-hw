class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    session["message"] = "Thank you for signing up!"
    if @user.save
      session["current_user_id"] = @user.id
      redirect_to shares_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params["id"])
  end

  def update
    @user = User.find(params["id"])
    if @user.update(user_params)
      redirect_to shares_path
    else
      render :edit
    end
  end

  def edit_password
    @user = User.find(params["user_id"])
  end

  def update_password
    @user = User.find(params["user_id"])
    if params[:user_password][:password] == params[:user_password][:confirm_password] && @user.update(user_password_params)
      redirect_to user_path(current_user.id)
    elsif params[:user_password][:password] != params[:user_password][:confirm_password]
      @message = "Passwords don't match!"
      render :edit_password
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :email, :nick_name)
  end

  def user_password_params
    params.require(:user_password).permit(:password)
  end

end
