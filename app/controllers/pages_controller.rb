class PagesController < ApplicationController


 include CurrentCart
   before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:index, :shop, :about, :search_results, :sale]

  
   def index
    if params[:category].blank?
    @products = Product.all.order("created_at DESC")
    else
    @category_id = Category.find_by(name: params[:category]).id
    @products = Product.where(category_id: @category_id).order("created_at DESC")
    end
    @sale_products = Product.sale
  end

  def shop
    @products = Product.all
  end

  def about
  end


   def sale
    @sale_products = Product.sale
  end


   private

  def set_product
      @product = Product.find(params[:id])
    end

  def product_params
      params.require(:product).permit(:name, :category_id, :description, :price, :image)
    end

end
