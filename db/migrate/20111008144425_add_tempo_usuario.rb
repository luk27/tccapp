class AddTempoUsuario < ActiveRecord::Migration
  def self.up
  add_column :profiles, :tempo_medio, :integer
  add_column :profiles, :last_login, :timestamp
  add_column :profiles, :logout, :timestamp
  end

  def self.down
  remove_column :profiles, :tempo_medio
  remove_column :profiles, :last_login
  end
end
