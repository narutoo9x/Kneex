class Section < ApplicationRecord
  has_many :food_items, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false}
  
  def self.generate_default
    %w(Breakfast Lunch Dinner Drinks).each do |section|
      Section.find_or_create_by(name: section)
    end
  end
end
