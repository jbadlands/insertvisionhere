class CreateDebates < ActiveRecord::Migration
  def self.up
    create_table :debates do |t|
      
	  t.text :proposition
	  t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :debates
  end
end
