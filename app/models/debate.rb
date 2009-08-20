class Debate < ActiveRecord::Base
	acts_as_taggable
	
	has_many :arguments, :order => 'id DESC', :dependent => :destroy 
	belongs_to :user
	
	validates_presence_of :proposition
end
