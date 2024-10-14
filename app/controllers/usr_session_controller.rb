class UsrSessionsController < ApplicationController
  def create
    @user = User.where("username = ? OR email = ?", params[:username], params[:username]).first

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path
    else
      redirect_to login_path, notice: "Check Username/Email and Password are correct"
    end
  end
end
