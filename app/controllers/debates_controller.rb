class DebatesController < ApplicationController
	before_filter :login_required

 # GET /debates
  # GET /debates.xml
  def index
	#my debates
    @debates = Debate.find(:all, :conditions => ["user_id = ?", current_user.id])

	#Status is 1 for private(default) and 2 for public
	@all_debates = Debate.find(:all, :conditions => ["user_id !=? ", current_user.id])
	
	#News
	@news = News.find(:all, :order => "id DESC")
	
	@debate  = Debate.new
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @debates }
    end
  end

  # GET /debates/1
  # GET /debates/1.xml
  def show
    @debate = Debate.find(params[:id])
	
	#@all_arguments	=	@debate.arguments.find(:all)
	
	#Create new argument object.
	@argument = Argument.new

    respond_to do |format|
      format.html # show.html.erb
     # format.xml  { render :xml => @debate }
    end
  end

  # POST /debates
  # POST /debates.xml
  def create
    @debate = Debate.create!(params[:debate])

	flash[:notice] = "Debate has been successfully started. Please outline your position"
	redirect_to @debate

  end


  # GET /debates/1/edit
  def edit
  
	@debate = Debate.find(params[:id])
	
	if is_creator? 
		respond_to do |format|
			format.html #edit.html.erb
			format.js 
		end
	else
		flash[:notice] = "You're not allowed to do that"
		redirect_to :back
	end
  end
 
  
  # PUT /debates/1
  # PUT /debates/1.xml
  def update	
	@debate = Debate.find(params[:id])

	if is_creator?

		if @debate.update_attributes(params[:debate])
			flash[:notice] = "Debate was successfully updated."
			redirect_to(@debate)
			
		else
			render :action => "edit"
		end
	else
		flash[:notice] = "You aren't authorised to do that" 
		redirect_to :back
	end
  end

    def delete
        @post = Debate.find( params[:id] )
        respond_to do |format|
            format.html # delete.html.erb
        end
    end

  
  
  
  # DELETE /debates/1
  # DELETE /debates/1.xml
  def destroy
	@debate = Debate.find(params[:id])
    
	if is_creator?
		@debate.destroy
		flash[:notice] = "Debate has been deleted"
		respond_to do |format|
			format.html {redirect_to :back}
			format.js
		end
	else
		flash[:notice] = "You can only delete your own debates fool"
		redirect_to(:back)	
    end
  end
  
  
  protected
	#Check is user is allowed to edit and update options of this debate.
    def is_creator?
		debate_creator? 
	end
	
	
	
end
