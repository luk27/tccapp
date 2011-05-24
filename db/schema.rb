# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110523235835) do

  create_table "avaliacaos", :force => true do |t|
    t.integer  "projeto_id"
    t.integer  "profile_id"
    t.integer  "avaliado_id"
    t.text     "texto"
    t.integer  "nota"
    t.integer  "nivel_habilidade"
    t.integer  "comprometimento"
    t.integer  "tempo_demora"
    t.integer  "criatividade"
    t.integer  "organicazao"
    t.integer  "comunicacao"
    t.integer  "trabalho_grupo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "avaliacaos", ["avaliado_id"], :name => "index_avaliacoes_on_avaliado_id"
  add_index "avaliacaos", ["profile_id"], :name => "index_avaliacoes_on_profile_id"
  add_index "avaliacaos", ["projeto_id"], :name => "index_avaliacoes_on_projeto_id"

  create_table "cursos", :force => true do |t|
    t.integer  "profile_id"
    t.string   "nome"
    t.string   "universidade"
    t.integer  "ano_ingresso"
    t.integer  "ano_termino"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cursos", ["profile_id"], :name => "index_cursos_on_profile_id"

  create_table "equipes", :force => true do |t|
    t.integer  "membro_id"
    t.integer  "projeto_id"
    t.boolean  "status",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "equipes", ["membro_id"], :name => "index_equipes_on_membro_id"
  add_index "equipes", ["projeto_id"], :name => "index_equipes_on_projeto_id"

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["recipient_id"], :name => "index_messages_on_recipient_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

  create_table "postagems", :force => true do |t|
    t.integer  "projeto_id"
    t.integer  "profile_id"
    t.text     "conteudo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postagems", ["profile_id"], :name => "index_postagems_on_profile_id"
  add_index "postagems", ["projeto_id"], :name => "index_postagems_on_projeto_id"

  create_table "profiles", :force => true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.date     "data_nascimento"
    t.string   "sexo"
    t.string   "email"
    t.string   "login"
    t.string   "senhacrip"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           :default => false
  end

  add_index "profiles", ["email"], :name => "index_profiles_on_email", :unique => true

  create_table "projetos", :force => true do |t|
    t.integer  "profile_id"
    t.string   "nome"
    t.text     "descricao"
    t.text     "motivacao"
    t.string   "site"
    t.integer  "completo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projetos", ["nome"], :name => "index_projetos_on_nome"
  add_index "projetos", ["profile_id"], :name => "index_projetos_on_profile_id"

end
