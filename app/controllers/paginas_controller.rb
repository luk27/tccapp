
class PaginasController < ApplicationController
  def home
@title= "Inicio"
  end

  def contato
@title = `Contato`
  end

  def sobre
@title = `Sobre`
  end

end
