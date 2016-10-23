class AddPasswordDigestToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :password_digest, :string
  end
end
