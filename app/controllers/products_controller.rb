class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :edit, :destroy ]

  def index
    @products = policy_scope(Product)
    @unique_categories = Product.distinct.pluck(:category)
  end

  def show
    @user = current_user
    authorize @user
    @marker =
      {
        lat: @user.latitude,
        lng: @user.longitude,
      }
    raise
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.owner_id = current_user.id
    authorize @product
    @product.save
    redirect_to user_path(current_user)
  end

  def destroy
    @product.destroy
    authorize @product
    redirect_to user_path(current_user)
  end

  def edit

  end

  def update
    @product.update(product_params)
  end


  def filter
    @category = params[:category]
    @size = params[:size] || []
    @color = params[:color] || []
    @brand = params[:brand] || []

    @products = Product.where(category: @category)
    @products = @products.where(size: @size) unless @size.empty?
    @products = @products.where(color: @color) unless @color.empty?
    @products = @products.where(brand: @brand) unless @brand.empty?
    authorize @products
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end


  def product_params
    params.require(:product).permit(:brand, :color, :size, :apparel_type, :category, :price_per_cycle, :description, :photo)
  end

end
