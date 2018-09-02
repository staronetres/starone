class Category < ApplicationRecord

    has_many :products

  validates :name, presence: true
  #validates :price, numericality: {greater_than_or_equal_to: 0.01}
  #validates :title, uniqueness: true

  def product_params
    params.require(:product).permit(:name, :category_id, :description, :price, :image)
  end

end
