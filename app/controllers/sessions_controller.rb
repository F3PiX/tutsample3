class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #created after including SessionHelper in AppController, and def log_in method
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid combination'

      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
