class RemoveAnsweredFromTracking < ActiveRecord::Migration[5.0]
  def change
    remove_column :trackings, :answered, :boolean
  end
end
