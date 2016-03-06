class Participant < ApplicationRecord
  enum age: { "10-20": 0, "21-30": 1, "31-40": 2, "41-50": 3, "51-60": 4, "61-70": 5, "71-99": 6 }
  enum gender: { male: 0, female: 1 }
  enum web_usage: { "sehr oft": 0, "oft": 1, "manchmal": 2, "selten": 3, "fast nie": 4 }
  enum computer_usage: { "sehr gut": 0, "gut": 1, "durchschnittlich": 2, "eher schlecht": 3, "schlecht": 4 }

  has_one :profession, dependent: :destroy
  has_many :trackings
  has_many :cases,  -> { uniq }, through: :trackings
  has_many :answers
  has_many :polls

  validates :age, presence: true
  validates :gender, presence: true
  validates :web_usage, presence: true
  validates :computer_usage, presence: true

  accepts_nested_attributes_for :profession

  before_create :generate_cases_order
  before_create :generate_case_sheets_order

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
    if self.cases_completed?
      self.polls.each do |poll|
        return true if poll.questionary.name == "conclusion"
      end
    end

    return false
  end

  def self.completed?
    all.select do |item|
      item.completed?
    end
  end

  private
  def generate_cases_order
    self.cases_order = (1..Case.count).to_a.shuffle.to_s
  end

  def generate_case_sheets_order
    self.sheet_order = (1..Case.sheets).to_a.shuffle.to_s
  end
end
