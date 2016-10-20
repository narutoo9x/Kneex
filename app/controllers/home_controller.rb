class HomeController < ApplicationController
  def index
  end

  def menu
    if params[:search]
      @food_items = FoodItem.search(params[:search])
    else
      if params[:section]
        @section = Section.where(name: params[:section]).first
        @food_items = @section.food_items
      else
        @food_items = FoodItem.all
      end
    end
  end

  def contact_us
  end
end
