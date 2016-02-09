class Questionary < ApplicationRecord
  has_many :questions

  def self.count_for_cases
    2
  end
end
