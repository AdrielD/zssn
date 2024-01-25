class Api::InfectionNotificationsController < ApiController
  def notify
    user = InfectionNotifications::User.new(user_params).perform
    render json: user, status: :ok
  end

  private

  def user_params
    params.permit(:user_id, :notifier_id)
  end
end
