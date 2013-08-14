class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @products = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success_message] = "Product successfuly added!"
      redirect_to "/products/new"
    else
      flash[:error_messages] = @product.errors.full_messages
      redirect_to "/products/new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
