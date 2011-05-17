class Curso < ActiveRecord::Base

belongs_to :profile


#validates :nome, :presence => true,
#:length   => { :maximum => 25 }

#validates :universidade, :presence => true,
#:length   => { :maximum => 30 }

#validates :ano_ingresso => true,
#:numericality => { :greater_than_or_equal_to => 1960, :less_than_or_equal_to => 2011 } 


#validates :ano_termino => true,
#:numericality => { :greater_than_or_equal_to => 1963, :less_than_or_equal_to => 2018} 


end
