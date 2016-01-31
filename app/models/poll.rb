class Poll < ApplicationRecord
  belongs_to :participant
  belongs_to :case
end
