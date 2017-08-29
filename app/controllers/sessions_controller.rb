class SessionsController < ApplicationController

  def new
    @user = User.new
    session[:user_id] = nil
  end

  def create
    @user = User.find_by(user_name: params[:user_name]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to '/'
    else
      erb :'/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
