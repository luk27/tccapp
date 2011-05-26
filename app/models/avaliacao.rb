# encoding: UTF-8
class Avaliacao < ActiveRecord::Base

belongs_to :profile, :class_name => 'Profile', :foreign_key => "profile_id"
belongs_to :avaliado, :class_name => 'Profile', :foreign_key => "avaliado_id"
belongs_to :projeto, :class_name => 'Projeto', :foreign_key => "projeto_id"

validates :texto, :presence => true

validates :nota, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 10 }

validates :nivel_habilidade, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }
validates :comprometimento, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }
validates :tempo_demora, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }
validates :criatividade, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }
validates :organicazao, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }
validates :comunicacao, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }
validates :trabalho_grupo, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 6 }




self.per_page = 1

end
