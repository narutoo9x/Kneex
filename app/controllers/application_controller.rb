class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helper medthod allow to access from view
  helper_method :current_order, :total_price

  def current_order
		@current_order = Order.last_pending || Order.create!(name: "Guest", address:  "Unknown")
  end

  def total_price
		current_order.amount - current_order.discount_amount
	end
end
