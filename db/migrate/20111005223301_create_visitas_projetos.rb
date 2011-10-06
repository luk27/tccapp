class CreateVisitasProjetos < ActiveRecord::Migration
  def self.up
    create_table :visitas_projetos do |t|
      t.integer :projeto_id
      t.timestamps
    end
  end

  def self.down
    drop_table :visitas_projetos
  end
end
