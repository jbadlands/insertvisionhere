# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '4f1001eeb8071a658fad4ce12b56241b'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  include AuthenticatedSystem
  
  helper_method :debate_creator? , :argument_creator , :has_argued , :can_edit_profile? , :is_admin? , :non_admin_block
  
  protected
	def non_admin_block!
		if is_admin?
			true
		else
			flash[:notice] = "You must be an administrator to do that"
			redirect_to :back
		end
	end	
	
	def is_admin?
		current_user.id == 10
	end
  
	def debate_creator?
		current_user.id == @debate.user_id
	end
  
	def argument_creator(id)
			current_user.id == id	
	end
	
	def can_edit_profile?
		current_user.id == @profile.user_id
	end
  
	def has_argued(id)
		#check if current_user.id == has a an argument that matches this database
		if Argument.first(:conditions =>  ["user_id =? AND debate_id =?", current_user.id, id])
			true
		else
			false
		end
	end
	
  
end
