class Habilidade < ActiveRecord::Base



belongs_to :profile

#validates :nome, :presence => true,
#:length   => { :maximum => 25 }
end
