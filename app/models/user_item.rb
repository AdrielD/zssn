class UserItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  after_update :remove_empty

  private

  def remove_empty
    self.destroy if (amount.zero?)
  end
end
