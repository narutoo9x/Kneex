class FoodItem < ApplicationRecord
  belongs_to :section

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true
  
  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

  def image_url_or_default
    if image_url.present?
      image_url
    else
      "http://loremflickr.com/320/240/#{name.gsub(' ', '+')}"  
    end
  end
  
end
