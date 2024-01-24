class User < ApplicationRecord
  has_many :user_items

  BIOLOGICAL_SEX = %w(male female other)

  validates :name, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :gender, inclusion: { in: BIOLOGICAL_SEX }
  validates :lat, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :lng, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }

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
    user_item
  end

  def forfeit_item(item_id, quantity)
    raise UserExceptions::InfectedCantTrade if self.infected

    user_item = UserItem.find_by(user_id: self.id, item_id: item_id)
    raise UserExceptions::ItemUnavailable if user_item.blank?

    new_amount = user_item.amount - quantity
    raise UserExceptions::NotEnoughItems if new_amount < 0

    user_item.update(amount: new_amount)
    user_item
  end
end
