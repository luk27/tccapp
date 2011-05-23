class Postagem < ActiveRecord::Base

 belongs_to :profile
 belongs_to :projeto
 #validate :has_permissao_projeto
validates :conteudo, :presence => true
  #def has_permissao_projeto
	#unless self.profile.dono_projetos.include?(self.projeto) || self.profile.projetos.include?(self.projeto)
#	  self.errors.add(:base, "you don't have permission to add a message to this group.")
	#end
 # end

default_scope :order => 'postagems.created_at DESC'
self.per_page = 6


end
