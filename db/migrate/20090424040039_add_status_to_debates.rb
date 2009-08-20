class AddStatusToDebates < ActiveRecord::Migration
  def self.up
    add_column :debates, :status, :integer, {:default => 1}
  end

  def self.down
    remove_column :debates, :status
  end
end
