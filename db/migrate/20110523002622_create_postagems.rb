class CreatePostagems < ActiveRecord::Migration
  def self.up
    create_table :postagems do |t|
      t.integer :projeto_id
      t.integer :profile_id
      t.text :post

      t.timestamps
    end
    add_index :postagems, :projeto_id
    add_index :postagems, :profile_id
  end

  def self.down
    drop_table :postagems
  end
end
