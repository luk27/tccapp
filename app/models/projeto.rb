class Projeto < ActiveRecord::Base

belongs_to :dono, :class_name => "Profile"
has_many :equipes
has_many :membros, :class_name => "Profile", :through => "equipes", :foreign_key => "membro_id"

end
