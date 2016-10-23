class Prodencomendado < ActiveRecord::Base
  belongs_to :produto
  belongs_to :pedido

  validates :quantidade, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:preco_unit]
    else
      produto.preco
    end
  end

  def total_price
    preco_unit * quantidade
  end

private
  def product_present
    if produto.nil?
      errors.add(:produto, "is not valid or is not active.")
    end
  end

  def order_present
    if pedido.nil?
      errors.add(:pedido, "is not a valid order.")
    end
  end

  def finalize
    self[:preco_unit] = preco_unit
    self[:valtotal] = quantidade * self[:preco_unit]
  end
end
