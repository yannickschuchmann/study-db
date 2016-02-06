class Participant < ApplicationRecord
  enum age: { "10-20": 0, "21-30": 1, "31-40": 2, "41-50": 3, "51-60": 4, "61-70": 5, "71-99": 6 }
  enum gender: { male: 0, female: 1 }
  enum web_usage: { "sehr oft": 0, "oft": 1, "manchmal": 2, "selten": 3, "nie": 4 }

  has_one :profession, dependent: :destroy
  has_many :trackings
  has_many :cases,  -> { uniq }, through: :trackings
  has_many :answers
  has_many :polls

  validates :age, presence: true
  validates :gender, presence: true
  validates :web_usage, presence: true

  accepts_nested_attributes_for :profession

  def cases_completed?
    if self.cases.count == Case.count
      all_completed = true
      self.cases.each {|c| all_completed = false unless c.completed?(self)}
      return all_completed
    else
      return false
    end
  end

  def completed?
    self.cases_completed?
  end
end
