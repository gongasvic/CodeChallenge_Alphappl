class Produto < ActiveRecord::Base
	has_many :prodencomendados
  	default_scope { where(active: true) }
end
