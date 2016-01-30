class Question < ApplicationRecord
  belongs_to :questionary
  has_many :answers
  has_many :participants, through: :participants
end
