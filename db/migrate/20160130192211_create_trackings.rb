class CreateTrackings < ActiveRecord::Migration[5.0]
  def change
    create_table :trackings do |t|
      t.belongs_to :case, foreign_key: true
      t.belongs_to :participant, foreign_key: true
      t.integer :time
      t.integer :case_sheet

      t.timestamps
    end
  end
end
