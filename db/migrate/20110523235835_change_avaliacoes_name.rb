class ChangeAvaliacoesName < ActiveRecord::Migration
 def self.up
        rename_table :avaliacoes, :avaliacaos
    end 
    def self.down
        rename_table :avaliacaos, :avaliacoes
    end
 end

