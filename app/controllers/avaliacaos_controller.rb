class AvaliacaosController < ApplicationController

layout "avaliacaos"

def new
@profile = Profile.find(params[:profile])
@avaliado = Profile.find(params[:avaliado])
@projeto = Projeto.find(params[:projeto_id])
@avaliacao = Avaliacao.new
end


def create
@profile = Profile.find(current_profile)
@avaliacao  = Avaliacao.new(params[:avaliacao])
@projeto = Projeto.find(params[:avaliacao][:projeto_id])
if @avaliacao.save
flash[:success] = "Avaliação Criada com Sucesso."
redirect_to @projeto
else
redirect_to (:back)
end
end


end
