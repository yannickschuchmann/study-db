class RemoveQuestionaryFromCases < ActiveRecord::Migration[5.0]
  def change
    remove_reference :cases, :questionary, foreign_key: true
  end
end
