class CreateCursos < ActiveRecord::Migration
  def self.up
    create_table :cursos do |t|
      t.integer :profile_id
      t.string :nome
      t.string :universidade
      t.integer :ano_ingresso
      t.integer :ano_termino

      t.timestamps
    end
    add_index :cursos, :profile_id
  end

  def self.down
    drop_table :cursos
  end
end
