class Auth::SessionsController < ApplicationController

  before_action :not_logged, only: [:new, :create]

  def new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to '/'
    else
      flash[:error] = "Something wrong!"
      render action: :new
    end
  end

  def destroy
    logout; redirect_to '/'
  end

  private

  def not_logged
    redirect_back_or_to '/' if current_user
  end

end
