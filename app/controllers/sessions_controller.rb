# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem

  
  # render new.rhtml


  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
		flash[:notice] = "Logged in successfully"
		redirect_to('/debates')
      end
	  redirect_to('/debates')
    else
      flash[:notice] = "Log in failed, please try again."
	  redirect_to ('/')
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "So long."
    redirect_back_or_default('/')
  end
end
