class Message < ActiveRecord::Base

  is_private_message :class_name => "Profile"
  
  #validates_presence_of :recipient_id, :message => "Campo email vazio ou inexistente"
  validates :recipient_id, :presence => { :message  => "Campo email vazio, inexistente ou possui formato incorreto"}
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :subject, :presence => true,
  :length   => { :minimum => 1 }
  #validates :to, :presence => true,
#:length   => { :maximum => 35 },
#:format   => { :with => email_regex },
#:uniqueness => { :case_sensitive => false }

#validates :to, :format   => { :with => email_regex, :message => "Email possui formato incorreto" }






  
  # The :to accessor is used by the scaffolding,
  # uncomment it if using it or you can remove it if not
  attr_accessor :to
  
end