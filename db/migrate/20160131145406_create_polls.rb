class CreatePolls < ActiveRecord::Migration[5.0]
  def change
    create_table :polls do |t|
      t.belongs_to :participant, foreign_key: true
      t.belongs_to :case, foreign_key: true
      t.boolean :answered

      t.timestamps
    end
  end
end
