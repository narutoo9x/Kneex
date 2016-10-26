class FoodItemsController < ApplicationController
  before_action :set_food_item, only: [:show, :edit, :update, :destroy]

  def index
    @food_items = FoodItem.all.order("created_at desc")
  end

  def show
    @food_item = FoodItem.find(params[:id])
    # FoodItem.increment_counter(:view, params[:id])
  end
  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.new(food_item_params)
    respond_to do |format|
      if @food_item.save
        format.js
        format.html { redirect_to food_items_path, notice: 'Food item was successfully created.' }
        format.json { render :show, status: :created, location: @food_item }
      else
        format.html { render :new }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @food_item.update(food_item_params)
        format.html { redirect_to @food_item, notice: 'Food Items was successfully updated.' }
        format.json { render :show, status: :ok, location: @food_item }
      else
        format.html { render :edit }
        format.json { render json: @food_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food_item.destroy
    respond_to do |format|
      format.html { redirect_to food_items_path, notice: 'Food item was successfully destroy' }
      format.json { head :no_content }
    end
  end
  private

    def set_food_item
      @food_item = FoodItem.find(params[:id])
    end

    def food_item_params
      params.require(:food_item).permit(:name, :description, :price, :image_url, :section_id)
    end

end
