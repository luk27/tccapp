class Avaliacao < ActiveRecord::Base

belongs_to :profile, :class_name => 'Profile', :foreign_key => "profile_id"
belongs_to :avaliado, :class_name => 'Profile', :foreign_key => "avaliado_id"
belongs_to :projeto, :class_name => 'Projeto', :foreign_key => "projeto_id"



end
