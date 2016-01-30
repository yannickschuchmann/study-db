class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :label
      t.string :kind
      t.belongs_to :questionary, foreign_key: true

      t.timestamps
    end
  end
end
