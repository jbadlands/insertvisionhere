class Profile < ActiveRecord::Base
	belongs_to :user, :foreign_key => :user_id
	
	 has_attached_file :avatar, 
					:styles => { :medium => "300x300>",
                                 :thumb => "150x150>" },			 
					:url => "assets/avatars/:id/:style/:basename.:extension",
					:path => ":rails_root/public/images/assets/avatars/:id/:style/:basename.:extension",
					:default_url => "/images/system/avatars/default/:style/default.jpg"
					
 
	#validates_attachment_presence :avatar
	validates_attachment_size :avatar, :less_than => 2.megabytes
	validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif']
 
	
							 

end
