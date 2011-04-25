class Message < ActiveRecord::Base

  is_private_message :class_name => "Profile"
  
  validates :recipient_id, :presence => true
  # The :to accessor is used by the scaffolding,
  # uncomment it if using it or you can remove it if not
  attr_accessor :to
  
end