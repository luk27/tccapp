class CreateAvaliacoes < ActiveRecord::Migration
  def self.up
    create_table :avaliacoes do |t|
      t.integer :projeto_id
      t.integer :profile_id
      t.integer :avaliado_id
      t.text :texto
      t.integer :nota
      t.integer :nivel_habilidade
      t.integer :comprometimento
      t.integer :tempo_demora
      t.integer :criatividade
      t.integer :organicazao
      t.integer :comunicacao
      t.integer :trabalho_grupo

      t.timestamps
    end
    add_index :avaliacoes, :projeto_id
    add_index :avaliacoes, :profile_id
    add_index :avaliacoes, :avaliado_id
  end

  def self.down
    drop_table :avaliacoes
  end
end
