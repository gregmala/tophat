class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :edit, :destroy ]


  def index
    @products = policy_scope(Product)
    @unique_categories = Product.distinct.pluck(:category)
  end

  def show
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
    @unfiltered = Product.where(category: params[:category])
    authorize @unfiltered
    @unique_colors = Product.distinct.pluck(:color)
    @unique_brands = Product.distinct.pluck(:brand)
    @unique_sizes = Product.distinct.pluck(:size)
    filters = params[:array].split("&")
    size_filter = filters.last.split("=")
    brand_filter = filters.first.split("=")
    brand_filter_usable = brand_filter.last.gsub("+"," ")
    @products = @unfiltered.select { |pro| pro.size == size_filter.last }
    @products = @unfiltered.select { |pro| pro.brand == brand_filter_usable}

  end

  private

  def set_product
    @product = Product.find(params[:id])
  end


  def product_params
    params.require(:product).permit(:brand, :color, :size, :apparel_type, :category, :price_per_cycle, :description)
  end

end
