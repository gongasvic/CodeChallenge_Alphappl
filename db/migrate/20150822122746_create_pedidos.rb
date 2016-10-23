class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :IVA, precision: 12, scale: 3
      t.decimal :shipping, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
     
      t.timestamps null: false
    end
  end
end
