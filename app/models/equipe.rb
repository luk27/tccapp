class Equipe < ActiveRecord::Base
attr_accessible :status


belongs_to :membro, :class_name => 'Profile'
belongs_to :projeto


end
