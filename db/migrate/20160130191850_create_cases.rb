class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.string :name
      t.belongs_to :questionary, foreign_key: true

      t.timestamps
    end
  end
end
