class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:save] = "User Successfully created. Please Log In"
      render :show
    else
      flash.now[:error] = @user.errors.full_message.join(",")
      render :new
    end
  end

  def show
    @user = current_user
  end

  def update
    #code
  end

  def destroy
    #code
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :username,
                                 :password,
                                 :password_confirmation
                                 )
  end

end
