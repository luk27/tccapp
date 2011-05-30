class ModificaProjeto < ActiveRecord::Migration
  def self.up
  add_column :projetos, :palavrachave1, :string
  add_column :projetos, :palavrachave2, :string
  add_column :projetos, :palavrachave3, :string
  end

  def self.down
  remove_column :projetos, :palavrachave1
  remove_column :projetos, :palavrachave2
  remove_column :projetos, :palavrachave3
  end
end
