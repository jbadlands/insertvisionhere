class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :name
      t.string :location
      t.integer :user_id
      t.text :interests
      t.text :qualifications
      t.string :avatar_url

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
