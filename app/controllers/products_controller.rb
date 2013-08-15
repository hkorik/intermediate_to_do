class ProductsController < ApplicationController
  def index
    @products = Product.all
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = Category.all
    @comment = Comment.new
  end

  def new
    @product = Product.new
    @categories = Category.all
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
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      flash[:success_message] = "Product successfuly updated!"
      if params[:page] == "edit"
        redirect_to "/products/#{@product.id}/edit"
      elsif params[:page] == "show"
        redirect_to "/products/#{@product.id}"
      end
    else
      flash[:error_messages] = @product.errors.full_messages
      if params[:page] == "edit"
        redirect_to "/products/#{@product.id}/edit"
      elsif params[:page] == "show"
         redirect_to "/products/#{@product.id}"
      end
    end
  end

  def destroy
  end
end
