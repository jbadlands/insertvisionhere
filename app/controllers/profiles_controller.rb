class ProfilesController < ApplicationController
  # GET /profiles/
  # GET /profiles/
	def index
		@profiles	=	Profile.find(:all)	
		#@profiles = @users.profiles.find(:all)
	end


  # GET /profiles/1
  # GET /profiles/1.xml
  def show
	@profile				= 	Profile.find(:first, :conditions => ["user_id =? ", params[:id]] )

	@my_debates				=	Debate.find(:all, :conditions => ["user_id =? ", params[:id]] )
	
	# This needs to be set once arguments has been fixed. It needs to find all debates that this user has argued. To display on profile/show
	@arguments				=	Argument.find(:all, :conditions => ["user_id =?", params[:id]])
	
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.xml
#  def new
#    @profile = Profile.new

#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @profile }
#    end
#  end

  # GET /profiles/1/edit
  def edit
	@profile = Profile.find(params[:id])
	
	if !can_edit_profile? 	
		flash[:notice] = "You're not allowed to edit that profile"
		redirect_to ('/debates')
	end
  end

  # POST /profiles
  # POST /profiles.xml
#  def create
#	@profile	=	Profile.update_attributes(params[:avatar])
	
#	flash[:notice] = "Profile picture has been uploaded"
#	redirect_to :back
	
 # end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        flash[:notice] = 'Profile was successfully updated.'
        format.html { redirect_to profile_path(@profile.user_id) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.xml
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to(profiles_url) }
      format.xml  { head :ok }
    end
  end  
  
end
