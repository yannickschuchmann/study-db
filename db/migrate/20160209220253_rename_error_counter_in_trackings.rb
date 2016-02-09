class RenameErrorCounterInTrackings < ActiveRecord::Migration[5.0]
  def change
    rename_column :trackings, :errorCounter, :error_counter
  end
end
