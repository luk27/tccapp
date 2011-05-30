class CreateHabilidades < ActiveRecord::Migration
  def self.up
    create_table :habilidades do |t|
      t.integer :profile_id
      t.string :nome
      t.string :descricao

      t.timestamps
    end
    add_index :habilidades, :profile_id
  end

  def self.down
    drop_table :habilidades
  end
end
