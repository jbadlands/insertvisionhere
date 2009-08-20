class AddDiscussionStatusToDebate < ActiveRecord::Migration
  def self.up
	add_column :debates, :discussion_status, :integer
  end

  def self.down
	remove_column :debates, :discussion
  end
end
