class ProductsController < ApplicationController
  def index
    @products = Product.all
    @unique_categories = Product.distinct.pluck(:category)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product.find(params[:id])
    @product.update(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:brand, :color, :size, :apparel_type, :category, :price_per_cycle, :description)
  end
end
