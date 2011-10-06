class CreateVisita < ActiveRecord::Migration
  def self.up
    create_table :visita do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :visita
  end
end
