class AddConfirmAtToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :confirm_at, :datetime
  end
end
