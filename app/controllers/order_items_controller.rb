class OrderItemsController < ApplicationController
		def create
		@order_items = OrderItem.create order_item_params
		@order_items.order = current_order
		if @order_items.save
			redirect_to menu_path
		else
			raise "cannot add to order. #{@order_items.errors.messages.to_sentence}"
		end

	end

	private

		def order_item_params
			params.require(:order_item).permit(:quantity, :food_item_id)
		end
end
