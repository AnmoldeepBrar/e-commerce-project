class CategoriesController < ApplicationController
    add_breadcrumb "Home", :root_path
    # Controller actions
    def index
        add_breadcrumb "Categories", categories_path
        add_breadcrumb "Products", list_products_path
        @categories = Category.all
      end

    def show
        @category = Category.find(params[:id])
      end
  end
  