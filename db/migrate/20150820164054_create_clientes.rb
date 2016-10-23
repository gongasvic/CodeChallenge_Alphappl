class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :morada
      t.string :cidade
      t.string :pais
      t.string :mail
      t.integer :telefone
      t.string :cpostal
      t.integer :nif
      t.string :titulo
      t.integer :cardNumb
      t.string :expDate
      t.string :nomeCartao

      t.timestamps null: false
    end
  end
end
