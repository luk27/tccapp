class ChangePostagemPost < ActiveRecord::Migration
  def self.up
  rename_column :postagems, :post, :conteudo
  end

  def self.down
   rename_column :postagems, :conteudo, :post
  end
end
