# encoding: UTF-8
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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150822122811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "morada"
    t.string   "cidade"
    t.string   "pais"
    t.string   "mail"
    t.integer  "telefone"
    t.string   "cpostal"
    t.integer  "nif"
    t.string   "titulo"
    t.integer  "cardNumb"
    t.string   "expDate"
    t.string   "nomeCartao"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
  end

  add_index "clientes", ["mail"], name: "index_clientes_on_mail", unique: true, using: :btree

  create_table "pedidos", force: :cascade do |t|
    t.decimal  "subtotal",   precision: 12, scale: 3
    t.decimal  "IVA",        precision: 12, scale: 3
    t.decimal  "shipping",   precision: 12, scale: 3
    t.decimal  "total",      precision: 12, scale: 3
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "prodencomendados", force: :cascade do |t|
    t.integer  "produto_id"
    t.integer  "pedido_id"
    t.decimal  "preco_unit", precision: 12, scale: 3
    t.integer  "quantidade"
    t.decimal  "valtotal",   precision: 12, scale: 3
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "prodencomendados", ["pedido_id"], name: "index_prodencomendados_on_pedido_id", using: :btree
  add_index "prodencomendados", ["produto_id"], name: "index_prodencomendados_on_produto_id", using: :btree

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.decimal  "preco",      precision: 12, scale: 3
    t.boolean  "active"
    t.integer  "stock"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_foreign_key "prodencomendados", "pedidos"
  add_foreign_key "prodencomendados", "produtos"
end
