class Question < ApplicationRecord
  belongs_to :questionary
  has_many :answers, dependent: :destroy
  has_many :participants, through: :participants
end
