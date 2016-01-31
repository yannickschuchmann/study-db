class AddFeelingsFilledToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :feelings_filled, :boolean, default: false
  end
end
