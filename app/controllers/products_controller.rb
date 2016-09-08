class ProductsController < ApplicationController
  respond_to :js

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
    @product = Product.new(params[:products])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash.now[:success] = "you've created a new product"
      redirect_to products_path
    else
      flash.now[:danger] = @product.errors.full_messages
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    if @product.destroy
      redirect_to products_path
    else
      redirect_to products_path(@product)
    end
  end


private


  def product_params
    params.require(:product).permit(:name, :price)
  end

end
