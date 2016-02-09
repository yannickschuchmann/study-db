class Case < ApplicationRecord
  has_many :trackings
  has_many :polls
  has_many :questionaries, through: :polls

  def self.sheets
    7
  end

  def completed? participant
     self.trackings_completed?(participant) and self.polls_completed?(participant)
  end

  def trackings_completed? participant
    self.trackings.where(participant: participant).count == Case.sheets
  end

  def polls_completed? participant
    self.polls.where(participant: participant, answered: true).count == Questionary.count_for_cases
  end
end
