class Api::UsersController < ApiController
  def create
    user = Users::Create.new(user_params).perform
    render json: user, status: :created
  end

  def locate
    user = Users::UpdateLocation.new(location_params).perform
    render json: user, status: :ok
  end

  def give
    render json: {}, status: :ok
  end

  def take
    render json: {}, status: :ok
  end

  def trade
    render json: {}, status: :ok
  end

  private

  def user_params
    params.permit(:name, :age, :gender, :lat, :lng)
  end

  def location_params
    params.permit(:id, :lat, :lng)
  end

  def item_params
    params.permit(:id, :item_id, :quantity)
  end
end
