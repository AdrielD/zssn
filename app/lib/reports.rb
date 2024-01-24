class Reports
  class << self
    def infected_users
      { infected: User.infected }
    end

    def healthy_users
      { infected: User.healthy }
    end

    def average_item_per_user
      Item.all.reduce({}) do |acc, item|
        index = "#{item.slug}_per_user"
        acc[index] = count_amount(item.id)
        acc
      end
    end

    def points_lost_on_infection
      infected_ids = User.infected.pluck(:id)
      infected_ids.reduce({}) do |acc, user_id|
        acc[user_id] = count_points(user_id)
        acc
      end
    end
  end

  private

  def count_points(user_id)
    user_items = UserItem.where(user_id: user_id)
    user_items.reduce(0) do |acc, user_item|
      acc + (user_item.amount * user_item.item.points)
    end
  end

  def count_amount(item_id)
    UserItem.where(item_id: item_id).reduce(0) do |acc, user_item|
      acc + user_item.amount
    end
  end
end
