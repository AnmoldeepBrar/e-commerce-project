class HomeController < ApplicationController
    def index
      #@products = Product.all  # Retrieve all products (you might want to limit or filter this based on your requirements)
      @products = Product.all.page(params[:page]).per(10)
      @categories = Category.all

      @products_on_sale = Product.where(on_sale: true)
      @recently_updated_products = Product.order(updated_at: :desc).limit(3)

      if params[:category_id].present?
        @products = @products.in_category(params[:category_id])
      end
    
      if params[:keyword].present?
        @products = @products.search_by_keyword(params[:keyword])
      end
    
      respond_to do |format|
        format.html # Render HTML by default (using index.html.erb)
        format.json { render json: @products } # Render JSON for API requests
      end
    end

    def search
      redirect_to products_path(keyword: params[:keyword], category_id: params[:category_id])
    end

    def set_product
      @product = Product.find(params[:id])
    end
  end