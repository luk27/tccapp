class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :nome
      t.string :sobrenome
      t.date :data_nascimento
      t.string :sexo
      t.string :email
      t.string :login
      t.string :senhacrip
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
