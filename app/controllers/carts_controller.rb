class CartsController < ApplicationController
  def index
  	@order = current_order
  end

  def confirm
  	@order = current_order
  	@order.confirm_at = Time.now
  	if @order.save
  		flash[:success] = "Thank you for your order."
  		redirect_to root_path
  	else
  		flash[:error] = "Can't order food."
  		render :index
  	end
  end

  private

  def order_params
  	params.require(:order).permit(:name, :address, :discount_code)
  end
end
