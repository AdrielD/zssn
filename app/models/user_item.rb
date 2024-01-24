class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_update { self.destroy if self.amount.zero? }
end
