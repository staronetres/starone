class ListingsController < ApplicationController

  include CurrentCart
  before_action :set_cart, only: [:index, :shop, :show, :about, :search_results]

  def index
    @products = Product.all
  end

  def search_results
    @products = Product.where(title: params[:search_keywords])
  end
  
 def create
 end
  def show
    @product = Product.find (params[:id])
  end
end
