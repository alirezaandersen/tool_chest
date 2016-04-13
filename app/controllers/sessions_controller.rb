class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:approve] = "Successful Login"
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Invalid Login"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to tools_path
  end

end
