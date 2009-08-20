class HomeController < ApplicationController
  def index
	if logged_in?
		redirect_to('/debates')
	end  
  end

end
