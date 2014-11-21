class UsersController < ApplicationController
  def login
    session[:email] = params[:email] if User.find(params[:email])
    redirect_to :back
  end

  def logout
    session.delete(:email)
    redirect_to :back
  end
end
