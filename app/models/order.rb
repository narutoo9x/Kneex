class Order < ApplicationRecord
	validates :name, presence: true

	has_many :order_items, dependent: :destroy

	def self.last_pending
  	where(confirm_at: nil).last
  end

  def amount
		order_items.map{|e| e.food_item.price*e.quantity}.sum
	end

	def discount_amount
		discount_code == 'CODERSCHOOL' ? 100 : 0
	end
end
