class AddRememberDigestToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :remember_digest, :string
  end
end
