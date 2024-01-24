class Users::Give
  def initialize(params)
    @id = params['id']
    @item_id = params['item_id']
    @quantity = params['quantity']
  end

  def perform
    user = User.find(@id)
    user.receive_item(@item_id, @quantity)
  end
end
