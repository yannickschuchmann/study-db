class Tracking < ApplicationRecord
  belongs_to :case
  belongs_to :participant

  validates :time, presence: true
  validates :time, numericality: { only_integer: true, greater_than: 0 }
  validates :case_sheet, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: Case.sheets }

  validates :case_sheet, uniqueness: { scope: [:case_id, :participant_id] }

  def completed
    !self.time.blank? && self.answered
  end
end