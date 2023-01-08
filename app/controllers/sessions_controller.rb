class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]

  def new # login form and submit data
    @messages = Message.all
    @users = User.all
  end

  def show # show users messages and details
    @user = current_user
    @user_messages = current_user.messages
  end

  def create # handle new form login data
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Berhasil login"
      redirect_to root_path
    else
      flash.now[:error] = "Ada yang salah dengan login Anda"
      render "new"
    end
  end

  def destroy # logout - delete session
    session[:user_id] = nil
    flash[:success] = "Anda berhasil logout"
    redirect_to root_path
  end

  private

  def logged_in_redirect
    if logged_in?
      flash[:error] = "Anda sudah login"
      redirect_to root_path
    end
  end
end
