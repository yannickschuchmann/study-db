class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :participant
  belongs_to :case, optional: true

  def self.types
    %w(Value Text Comparison)
  end
end

class Comparison < Answer
end