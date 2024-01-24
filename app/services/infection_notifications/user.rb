class InfectionNotifications::User
  USER_INFECTION_TRESHOLD = 3

  def initialize(params)
    @user_id = params['user_id']
    @notifier_id = params['notifier_id']
  end

  def perform
    user = User.find(@user_id)
    notfier = User.find(@notifier_id)

    raise UserExceptions::InfectedCantNotify if notfier.infected

    already_notified = InfectionNotification.find_by(user_id: @user_id, notifier_id: @notifier_id)
    raise UserExceptions::DuplicatedInfectionNotification if already_notified.present?

    InfectionNotification.create(user_id: @user_id, notifier_id: @notifier_id)
    infection_count = InfectionNotification.where(user_id: @user_id).count

    if (infection_count > USER_INFECTION_TRESHOLD)
      user.update(infected: true)
    end
  end
end
