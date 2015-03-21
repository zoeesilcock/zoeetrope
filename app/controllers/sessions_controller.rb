class SessionsController < ApplicationController
  def new
    redirect_to root_url if logged_in?
  end

  def create
    user = login(params[:email], params[:password])
    redirect_to projects_url
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
