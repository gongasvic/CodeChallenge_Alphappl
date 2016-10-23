class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :clientes, :mail, unique: true
  end
end
