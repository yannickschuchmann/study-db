class Profession < ApplicationRecord
  belongs_to :job
  belongs_to :participant

  def name
    self.job.name
  end
end
