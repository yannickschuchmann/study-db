class CreateProfessions < ActiveRecord::Migration[5.0]
  def change
    create_table :professions do |t|
      t.belongs_to :job, index: true, foreign_key: true
      t.belongs_to :participant, index: true, foreign_key: true
      t.string :additionals

      t.timestamps
    end
  end
end
