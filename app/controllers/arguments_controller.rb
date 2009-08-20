class ArgumentsController < ApplicationController
	before_filter :login_required

	def index
	
	end

	def create
	
		# might be able to swap this for debate.argument.create!
		#and take out the hidden debate_id field in the form 
		#clean this up with better associations, 
		#@debate is used for updating the argument count in create.rjs

		
		@debate	=	Debate.find(params[:debate_id])
		
		if !has_argued(@debate.id)
			@argument = @debate.arguments.create!(params[:argument])
			flash[:notice] = "You have now argued your case"
		
			@args =	Argument.find(:all, :conditions => ["debate_id =? ", params[:debate_id]])
		
			respond_to do |format|
					format.html
					format.js
			end
		else
			flash[:notice] = "You can only argue once"
			redirect_to :back
		end
	end
	
##		@argument	=	Argument.find(params[:id])
		
#		@args		=	Debate.find(:debate_id, :conditions
		
		
#		if argument_creator(@argument.user_id)
#			@argument.update_attributes(params[:argument])
		
#			flash[:notice] = "Your opinion has been silenced"
		
#			respond_to do |format|
#				format.html
#				format.js
#			end
#		else
#			flash[:notice] = "You aren't authorised to to that"
#			redirect_to :back
#		end
#	end

#	def show
#		@debate	=	Debate.find(params[:debate_id])
#		@argument = @debate.arguments.find(params[:id])
		
#		respond_to do |format|
#			format.html
#			format.js
#		end
#	end
 
   # GET /arguments/1/edit
#  def edit
  
#	@argument = Argument.find(params[:id])
	
#	if is_creator? 
#		respond_to do |format|
#			format.html #edit.html.erb
#			format.js 
#		end
#	else
#		flash[:notice] = "You're not allowed to do that"
#	end
 # end

	def destroy
		@debate		=	Debate.find(params[:debate_id])
		@argument 	= 	Argument.find(params[:id])
		@args		=	@debate.arguments.size - 1
		
		if argument_creator(@argument.user_id)
			@argument.destroy

			@argument = Argument.new
			
			flash[:notice]	=	"Your argument has been removed"
			respond_to do |format|
				format.html
				format.js
			end
		else 
			flash[:notice] = "That's not your own argument you're trying to delete fool"
			redirect_to :back
		end
	end
  

end