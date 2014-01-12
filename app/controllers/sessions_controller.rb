class SessionsController < ApplicationController
  def create
    user = login(params[:email], params[:password])
    redirect_to root_url
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
