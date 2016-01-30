class Case < ApplicationRecord
  belongs_to :questionary
  has_many :trackings
end
