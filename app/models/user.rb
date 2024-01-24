class User < ApplicationRecord
  has_many :user_items

  scope :healthy, -> { where(infected: false) }
  scope :infected, -> { where(infected: true) }

  def inventory
    user_items unless self.infected
  end

  def receive_item(item_id, quantity)
    raise UserExceptions::InfectedCantTrade if self.infected

    user_item = UserItem.find_by(user_id: self.id, item_id: item_id)

    if (user_item.blank?)
      UserItem.create(user_id: self.id, item_id: item_id, amount: quantity)
    elsif
      user_item.update(amount: user_item.amount + quantity)
    end
  end

  def forfeit_item(item_id, quantity)
    raise UserExceptions::InfectedCantTrade if self.infected

    user_item = UserItem.find_by(user_id: self.id, item_id: item_id)
    raise UserExceptions::ItemUnavailable if user_item.blank?

    new_amount = user_item.amount - quantity
    raise UserExceptions::NotEnoughItems if new_amount < 0

    user_item.update(amount: new_amount)
  end
end
