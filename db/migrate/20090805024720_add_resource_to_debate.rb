class AddResourceToDebate < ActiveRecord::Migration
  def self.up
	add_column :debates, :resource, :string
  end

  def self.down
	remove_column :debates, :resource
  end
end
