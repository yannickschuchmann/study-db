class SetDefaultForErrorcounter < ActiveRecord::Migration[5.0]
  def change
    change_column_default :trackings, :error_counter, 0
  end
end
