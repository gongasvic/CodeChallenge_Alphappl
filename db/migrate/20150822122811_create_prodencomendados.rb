class CreateProdencomendados < ActiveRecord::Migration
  def change
    create_table :prodencomendados do |t|
      t.references :produto, index: true, foreign_key: true
      t.references :pedido, index: true, foreign_key: true
      t.decimal :preco_unit, precision: 12, scale: 3
      t.integer :quantidade
      t.decimal :valtotal, precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
