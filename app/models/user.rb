class User < ApplicationRecord
  INFECTION_REPORT_TRESHOLD = 3

  has_many :user_items

  scope :healthy, -> { where(infected: false) }
  scope :infected, -> { where(infected: true) }

  before_save :check_infection

  def inventory
    user_items unless self.infected
  end

  private

  def check_infection
    if (infection_report_count >= INFECTION_REPORT_TRESHOLD)
      self.infected = true
    end
  end
end
