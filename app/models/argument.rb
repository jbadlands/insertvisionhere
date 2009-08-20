class Argument < ActiveRecord::Base
	belongs_to :debate
	belongs_to :user
	
	validates_presence_of :argument
	validates_presence_of :side
end
