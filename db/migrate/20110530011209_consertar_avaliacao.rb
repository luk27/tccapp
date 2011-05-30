class ConsertarAvaliacao < ActiveRecord::Migration
  def self.up
  rename_column :avaliacaos, :organicazao, :organizacao
  end

  def self.down
  rename_column :avaliacaos, :organizacao ,:organicazao
  end
end
