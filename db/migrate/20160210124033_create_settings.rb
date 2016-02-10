class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :name
      t.boolean :maintenance

      t.timestamps
    end
  end
end
