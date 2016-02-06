class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :participant
  belongs_to :case

  self.inheritance_column = :_type_disabled

  validates :type, presence: true
  validates :value, presence: true, unless: Proc.new { |a| a.type == "text" }
  validates :text, presence: true, if: Proc.new { |a| a.type == "text" }

  def self.types
    %w(Value Text Comparison)
  end
end

class Comparison < Answer
end

class Value < Answer
end

class Text < Answer
end