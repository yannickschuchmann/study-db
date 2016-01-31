class Case < ApplicationRecord
  belongs_to :questionary
  has_many :trackings
  has_many :polls

  def self.sheets
    4
  end
end
