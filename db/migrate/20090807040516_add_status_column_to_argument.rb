class AddStatusColumnToArgument < ActiveRecord::Migration
  def self.up
	add_column :arguments, :status, :integer, :default => 1
  end

  def self.down
	remove_column :argumets, :status
  end
end
