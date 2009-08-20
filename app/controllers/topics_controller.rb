class TopicsController < ApplicationController
	
	def index
		@topics = Debate.tag_counts
	end

	
	def show
		@topic = Debate.find_tagged_with(params[:id])
	end
  
end
