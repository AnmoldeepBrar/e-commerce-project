class HomeController < ApplicationController
    def index
      #@products = Product.all  # Retrieve all products (you might want to limit or filter this based on your requirements)
      @products = Product.all.page(params[:page]).per(10)

      @products_on_sale = Product.where(on_sale: true)
      @recently_updated_products = Product.order(updated_at: :desc).limit(3)
    end
  end