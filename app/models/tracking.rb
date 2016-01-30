class Tracking < ApplicationRecord
  belongs_to :case
  belongs_to :participant
end
