class AddDefaultToTrackings < ActiveRecord::Migration[5.0]
  def change
    change_column_default :trackings, :errors, 0
  end
end
