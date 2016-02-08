class RenameErrorsInTrackings < ActiveRecord::Migration[5.0]
  def change
    rename_column :trackings, :errors, :errorCounter
  end
end
