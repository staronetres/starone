class CategoriesController < InheritedResources::Base

  include CurrentCart
    before_action :set_cart, only: [:index, :shop, :about]
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  respond_to :html

  def index
    if params[:category].blank?
    @products = Product.all.order("created_at DESC").page(params[:page]).per(3)
    else
    @category_id = Category.find_by(name: params[:category]).id
    @products = Product.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def show
    if params[:category].blank?
    @products = Product.all.order("created_at DESC").page(params[:page]).per(3)
    else
    @category_id = Category.find_by(name: params[:category]).id
    @products = Product.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    @category.save
  end

  def update
    @category.update(category_params)
  end

  def destroy
    @category.destroy
  end


  private

  def set_category
    @category = Category.find(params[:id])
  end

    def category_params
      params.require(:category).permit(:name, :description, :total_pages)
    end



end

