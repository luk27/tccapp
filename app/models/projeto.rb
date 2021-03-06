# encoding: UTF-8
class Projeto < ActiveRecord::Base


belongs_to :profile, :class_name => "Profile"
has_many :equipes, :dependent => :destroy
has_many :membros, :class_name => "Profile", :through => "equipes", :foreign_key => "membro_id"
#scope :pedidop, where(:status => false)


#PARTE NOVA DO CACHORRO
  has_many :membros_aprovados,:through => :equipes, :source => :membro, :conditions => [ "equipes.status = ? ", true]

  has_many :membros_aplicados,:through => :equipes, :source => :membro, :conditions => [ "equipes.status = ? ", false]
#####

has_many :postagems, :dependent => :destroy


###AVALIACOES
has_many :avaliacaos, :class_name => "Avaliacao", :foreign_key => "projeto_id", :dependent => :destroy

#########


validates :nome, :presence => true,
:length   => { :maximum => 25}

validates :motivacao, :presence => true
validates :descricao, :presence => true

validates :completo, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 } 


end
