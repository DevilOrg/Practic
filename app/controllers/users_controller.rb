class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      redirect_to "/"
    else
      render action: :new
    end
  end

  private

  def user_params
    params[:user].permit :email
  end

end
