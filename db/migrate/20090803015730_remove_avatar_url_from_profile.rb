class RemoveAvatarUrlFromProfile < ActiveRecord::Migration
  def self.up
	remove_column :profiles, :avatar_url
  end

  def self.down
	add_column :profiles, :avatar_url, :string
  end
end
