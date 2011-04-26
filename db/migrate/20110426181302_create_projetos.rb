class CreateProjetos < ActiveRecord::Migration
  def self.up
    create_table :projetos do |t|
      t.integer :profile_id
      t.string :nome
      t.text :descricao
      t.text :motivacao
      t.string :site
      t.integer :completo

      t.timestamps
    end
    add_index :projetos, :profile_id
    add_index :projetos, :nome
  end

  def self.down
    drop_table :projetos
  end
end
