class Users::Give
  def initialize(params)
    @id = params[:id].to_i
    @item_id = params[:item_id].to_i
    @quantity = params[:quantity].to_i
  end

  def perform
    user = User.find(@id)
    user.receive_item(@item_id, @quantity)
  end
end
