# encoding: UTF-8
class Equipe < ActiveRecord::Base

attr_accessible :membro_id, :projeto_id, :status, :membro, :projeto


belongs_to :membro, :class_name => 'Profile'
belongs_to :projeto
scope :pedido, where(:status => false)

end
