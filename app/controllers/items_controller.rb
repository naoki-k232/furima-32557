class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:title, :produce_description, :categories_id, :produce_conditions_id, :shipping_charges_id,
                                 :prefectures_id, :days_to_deliveries_id, :price, :image).merge(user_id: current_user.id)
  end
end
