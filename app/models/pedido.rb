class Pedido < ActiveRecord::Base
  has_many :prodencomendados
  before_save :update_subtotal

  def subtotal
    prodencomendados.collect { |oi| oi.valid? ? (oi.quantidade * oi.preco_unit) : 0 }.sum
  end
private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
