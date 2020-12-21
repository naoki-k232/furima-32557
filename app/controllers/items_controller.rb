class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:index, :show]

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
    @item = Item.find(params[:id])
    if current_user.id == @item.user_id
      else
        redirect_to root_path
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
        redirect_to item_path
      else
        render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :produce_description, :categories_id, :produce_conditions_id, :shipping_charges_id,
                                 :prefectures_id, :days_to_deliveries_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
