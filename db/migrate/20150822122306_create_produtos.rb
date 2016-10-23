class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.decimal :preco, precision: 12, scale: 3
      t.boolean :active
      t.integer :stock

      t.timestamps null: false
    end
  end
end
