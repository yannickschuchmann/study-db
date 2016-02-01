class RemoveFeelingsFilledFromParticipant < ActiveRecord::Migration[5.0]
  def change
    remove_column :participants, :feelings_filled, :boolean
  end
end
