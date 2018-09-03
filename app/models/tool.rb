class Tool < ApplicationRecord

    has_many :product_tools
 has_many :products, through: :product_tools
end
