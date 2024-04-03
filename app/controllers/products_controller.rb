class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def product_params
    params.require(:product).permit(:name, :description, :price, category_ids: [])
  end

  def index
    @products = Product.all.page(params[:page]).per(10)
    @categories = Category.all

    @products_on_sale = Product.where(on_sale: true)
    @recently_updated_products = Product.order(updated_at: :desc).limit(3)

    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end
  
    if params[:keyword].present?
      @products = @products.search_by_keyword(params[:keyword])
    end

    if params[:q].present?
      @products = @products.search(params[:q])
    end
  
    respond_to do |format|
      format.html # Render HTML by default (using index.html.erb)
      format.json { render json: @products } # Render JSON for API requests
    end
  end

  # def search
  #   redirect_to products_path(keyword: params[:keyword], category_id: params[:category_id])
  # end

  def show
    # @product is already set by the before_action :set_product
  end

  def show_by_category
    @category = Category.find(params[:category_id])
    @products = @category.products
  end

  def sale
    @products = Product.where(on_sale: true)
    render :index # Render the index template for products on sale
  end

  def recent_updates
    @products = Product.order(updated_at: :desc).limit(3) # Fetch 10 most recently updated products
    render :index # Render the index template for recently updated products
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
