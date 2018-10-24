class Api::ProductsController < ApplicationController
    def index
        @products = Product.all 
        render json: @products, status: 200
    end 

    def show 
        @product = Product.find_by_id(params[:id])
        render json: @product
    end


    private

    def product_params
        params.require(:product).permit(:name, :brand, :description, :category_id, :model, :image_url, :price)
    end


end
