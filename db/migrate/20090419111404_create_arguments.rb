class CreateArguments < ActiveRecord::Migration
  def self.up
    create_table :arguments do |t|
      t.text :argument
      t.integer :user_id
      t.integer :debate_id
      t.string :side
      t.integer :support

      t.timestamps
    end
  end

  def self.down
    drop_table :arguments
  end
end
