class RecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_record = OrderRecord.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def new
    @order_record = OrderRecord.new
  end

  def create
    @order_record = OrderRecord.new(record_params)
    @item = Item.find(params[:item_id])
    if @order_record.valid?
      pay_item
      @order_record.save
      return redirect_to root_path
    else
      render :index
    end
  end


  private

  def record_params
     params.require(:order_record).permit(:postal_code, :prefectures_id, :municipality, :house_number, :phone_number, :building_name).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id] )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
