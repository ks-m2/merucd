class ProductCommentsController < ApplicationController
  def create
  	product = Product.find(params[:product_id])
    content = current_user.product_comments.new(product_comment_params)
    content.product_id = product.id
    content.save
    redirect_to product_path(product.id)
    
  end

  def edit
  end

  def update
  end

  def destroy
  	product_comment = ProductComment.find(params[:id])
  	q = Product.find(product_comment.product_id)
  	product_comment.destroy
  	redirect_to product_path(q.id)
  end


 private
    def product_comment_params
    params.require(:product_comment).permit(:content)
  end
end
