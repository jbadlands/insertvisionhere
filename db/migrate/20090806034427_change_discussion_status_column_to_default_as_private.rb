class ChangeDiscussionStatusColumnToDefaultAsPrivate < ActiveRecord::Migration
  def self.up
	change_column :debates, :discussion_status, :integer, :default => 1
  end

  def self.down
  	change_column :debates, :discussion_status, :integer
  end
end
