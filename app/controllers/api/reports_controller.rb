class Api::ReportsController < ApiController
  def infected_users
    result = DataReports.infected_users
    render json: result, status: :ok
  end

  def healthy_users
    result = DataReports.healthy_users
    render json: result, status: :ok
  end

  def average_item_per_user
    result = DataReports.average_item_per_user
    render json: result, status: :ok
  end

  def points_lost_on_infection
    result = DataReports.points_lost_on_infection
    render json: result, status: :ok
  end
end
