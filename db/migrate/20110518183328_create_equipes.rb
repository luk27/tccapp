class CreateEquipes < ActiveRecord::Migration
  def self.up
    create_table :equipes do |t|
      t.integer :membro_id
      t.integer :projeto_id
      t.boolean :status, :default => false


      t.timestamps
    end
    add_index :equipes, :projeto_id
    add_index :equipes, :membro_id
  end

  def self.down
    drop_table :equipes
  end
end
