class AvaliacaosController < ApplicationController




def new
@avaliacao = Avaliacao.new
end


def create
@profile = Profile.find(current_profile)
@avaliacao = Avaliacao.create(:projeto => Projeto.find(params[:projeto_id]), 
:profile => Profile.find(current_profile), 
:avaliado => Profile.find(current_profile))#:avaliado => Profile.find(params[:profile_id]))
if @avaliacao.save
flash[:success] = "LOL."
redirect_to (:back)
else
redirect_to (:back)
end
end


def show

end





end
