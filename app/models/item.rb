class Item < ApplicationRecord
  validates :name, presence: true
  validates :slug, uniqueness: true
  validates :points, numericality: { only_integer: true, greater_than: 0 }

  before_save { self.slug = self.name.downcase.to_sym }
end
