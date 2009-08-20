class ChangeQualificationToChangeOnProfile < ActiveRecord::Migration
  def self.up
	rename_column :profiles, 'qualifications', 'change'
  
  end

  def self.down
	rename_column :profiles, 'change', 'qualifications'
  end
end
