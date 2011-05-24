class AvaliacaosController < ApplicationController




def new
@profile = Profile.find(params[:profile])
@avaliado = Profile.find(params[:avaliado])
@projeto = Projeto.find(params[:projeto_id])
@avaliacao = Avaliacao.new
end


def create
@profile = Profile.find(current_profile)
#@pedido_aceito = @profile.participacao_equipes.find_all_by_status(true,:include => [:projeto, :membro])
#@pedido_aceito.each do |agm|
#@avaliacao = Avaliacao.create(:projeto => Projeto.find(params[:projeto_id]), 
#:profile => Profile.find(current_profile), 
#:avaliado => Profile.find(agm.membro.id))#:avaliado => Profile.find(params[:profile_id]))
#end
@avaliacao = Avaliacao.create(:projeto => Projeto.find(params[:projeto_id]), 
:profile => Profile.find(params[:profile]),
:avaliado => Profile.find(params[:avaliado]))
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
