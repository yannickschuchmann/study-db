class AddQuestionaryToPolls < ActiveRecord::Migration[5.0]
  def change
    add_reference :polls, :questionary, foreign_key: true
  end
end
