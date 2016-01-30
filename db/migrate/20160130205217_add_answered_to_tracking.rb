class AddAnsweredToTracking < ActiveRecord::Migration[5.0]
  def change
    add_column :trackings, :answered, :boolean, default: false
  end
end
