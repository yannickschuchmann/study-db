class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :participant
  belongs_to :case, optional: true

  self.inheritance_column = :_type_disabled

  validates :value, presence: true, if: Proc.new { |a| a.question.required and a.question.kind != "text" }
  validates :text, presence: true, if: Proc.new { |a| a.question.required and a.question.kind == "text" }

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