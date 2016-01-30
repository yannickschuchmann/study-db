class Tracking < ApplicationRecord
  belongs_to :case
  belongs_to :participant

  def completed
    !self.time.blank? && self.answered
  end
end
