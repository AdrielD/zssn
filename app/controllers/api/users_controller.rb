class Api::UsersController < ApiController
  def create
    user = Users::Create.new(user_params).perform
    render json: user, status: :created
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end

  def locate
    user = Users::Locate.new(location_params).perform
    render json: user, status: :ok
  end

  def inventory
    inventory = User.find(params[:id]).inventory
    render json: inventory, status: :ok
  end

  def give
    inventory = Users::Give.new(item_params).perform
    render json: inventory, status: :ok
  end

  def take
    inventory = Users::Take.new(item_params).perform
    render json: inventory, status: :ok
  end

  def trade
    offer_a, offer_b = trade_params[:offers]
    result = Users::Trade.new(offer_a, offer_b).perform
    render json: {}, status: :ok
  end

  private

  def user_params
    params.permit(:name, :age, :gender, :lat, :lng)
  end

  def location_params
    params.permit(:id, :lat, :lng, :address)
  end

  def item_params
    params.permit(:id, :item_id, :quantity)
  end

  def trade_params
    params.permit(offers: [:user_id, item_list: [:id, :quantity]])
  end
end
