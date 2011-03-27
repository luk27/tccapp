class Profile < ActiveRecord::Base
attr_accessible :nome, :email, :sexo, :sobrenome, :data_nascimento

email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


validates :nome, :presence => true,
:length   => { :maximum => 12 }


validates :sobrenome, :presence => true,
:length   => { :maximum => 25 }


validates :email, :presence => true,
:length   => { :maximum => 35 },
:format   => { :with => email_regex },
:uniqueness => { :case_sensitive => false }

#validates :data_nascimento, :presence => true

validates :sexo, :presence => true


end
