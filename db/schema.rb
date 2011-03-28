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

ActiveRecord::Schema.define(:version => 20110328182538) do

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

end
