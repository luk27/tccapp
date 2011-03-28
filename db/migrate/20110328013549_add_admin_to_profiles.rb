class AddAdminToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :admin, :boolean, :default => false
  end

  def self.down
    remove_column :profiles, :admin
  end
end
