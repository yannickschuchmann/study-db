class Profession < ApplicationRecord
  belongs_to :job
  belongs_to :participant
end
