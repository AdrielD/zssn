class Api::ReportsController < ApiController
  def infected_users
    result = Reports.infected_users
    render json: { infected_users: result }, status: :ok
  end

  def healthy_users
    result = Reports.healthy_users
    render json: { healthy_users: result }, status: :ok
  end

  def average_item_per_user
    result = Reports.average_item_per_user
    render json: { average_item_per_user: result }, status: :ok
  end

  def points_lost_on_infection
    result = Reports.points_lost_on_infection
    render json: { points_lost_on_infection: result }, status: :ok
  end
end
