class Poll < ApplicationRecord
  belongs_to :participant
  belongs_to :case, optional: true
  belongs_to :questionary
end
