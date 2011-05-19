class Equipe < ActiveRecord::Base



belongs_to :membro, :class_name => 'Profile'
belongs_to :projeto


end
