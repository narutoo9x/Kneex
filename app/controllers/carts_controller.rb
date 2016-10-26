class CartsController < ApplicationController
  def index
  	@order = current_order
  end

  def confirm
  	@order = current_order
    @order.confirm_at = Time.now
  	if @order.save
  		flash[:success] = "Thank you for your order."
  		redirect_to carts_show_path
  	else
  		flash[:error] = "Can't order food."
  		render :index
  	end
  end

  def show
    @last_order = Order.last
  end
  private

  def order_params
  	params.require(:order).permit(:name, :address, :email, :discount_code)
  end
end
