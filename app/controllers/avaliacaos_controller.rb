class AvaliacaosController < ApplicationController




def new
@profile = Profile.find(params[:profile])
@avaliado = Profile.find(params[:avaliado])
@projeto = Projeto.find(params[:projeto_id])
@avaliacao = Avaliacao.new
end


def create
@profile = Profile.find(current_profile)
#@projeto = :projeto
#@pedido_aceito = @profile.participacao_equipes.find_all_by_status(true,:include => [:projeto, :membro])
#@pedido_aceito.each do |agm|
#@avaliacao = Avaliacao.create(:projeto => Projeto.find(params[:projeto_id]), 
#:profile => Profile.find(current_profile), 
#:avaliado => Profile.find(agm.membro.id))#:avaliado => Profile.find(params[:profile_id]))
#end
#@projeto = Projeto.find(params[:projeto_id])
#puts "AEW LOL"
#puts @projeto.id
#@avaliacao  = Avaliacao.new(params[:avaliacao])
#@avaliacao  = @projeto.avaliacaos.new(params[:avaliacao])
@avaliacao = Avaliacao.new(:projeto => Projeto.find(params[:avaliacao][:projeto]), 
:profile => Profile.find(params[:avaliacao][:profile]),
:avaliado => Profile.find(params[:avaliacao][:avaliado]))
@projeto = Projeto.find(params[:avaliacao][:projeto])
if @avaliacao.save
flash[:success] = "Avaliacao Criada com Sucesso."
redirect_to (:back)
else
redirect_to (:back)
end
end



def index

end

def show

end





end
