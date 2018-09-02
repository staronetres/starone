class Product < ApplicationRecord

      before_destroy :ensure_not_product_item


    belongs_to :category
    has_many :product_items


    validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true

   def self.sale
       where(subtitle: 'sale')
  end

  mount_uploader :image, ImageUploader

   def ensure_not_product_item
      if product_items.empty?
          return true
        else
          errors.add(:base, 'You have Product Items')
          return false
        end
    end
end
