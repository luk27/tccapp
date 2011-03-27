# encoding: UTF-8
class PaginasController < ApplicationController
  def home
@title= "Início"
  end

  def contato
@title = `Contato`
  end

  def sobre
@title = `Sobre`
  end

  def ajuda
    @title = "Ajuda"
end

end
