class CommentsController < ApplicationController
  def index
  	@comments = Comment.all
  end

  def create
  	@comment = Comment.new(params[:comment])
  	if @comment.save
  		flash[:success_message] = "Comment successfuly added!"
      redirect_to "/products/#{@comment.product_id}"
    else
      flash[:error_messages] = @comment.errors.full_messages
      redirect_to "/products/#{@comment.product_id}"
    end
  end

end
