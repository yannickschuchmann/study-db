class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.integer :value
      t.string :type
      t.string :text
      t.belongs_to :question, foreign_key: true
      t.belongs_to :participant, foreign_key: true
      t.belongs_to :case, foreign_key: true

      t.timestamps
    end
  end
end
