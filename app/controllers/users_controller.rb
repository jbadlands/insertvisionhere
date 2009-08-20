class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem
  layout "home"
  
  def index
	redirect_to '/profiles'
  end
  
  def show
	redirect_to "/profiles/#{params[:id]}"
  end

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
	  
		@profile = Profile.new(:name => @user.login, :user_id => @user.id)
		@profile.save
	  
		if @profile.errors.empty?
			flash[:notice] = "Thanks for joining us, check your email to activate your account."
			redirect_to('/home')
		else
			flash[:notice]	=	"There has been an error, administrators have been notified"
			render :new
		end
    else
		flash[:notice]	=	"There is an error with your registration"
		render :new  
    end
  end

  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

end
