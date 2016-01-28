class CreateParticipants < ActiveRecord::Migration[5.0]
  def change
    create_table :participants do |t|
      t.integer :age
      t.integer :gender
      t.integer :web_usage
      t.string :token

      t.timestamps
    end
  end
end
