class AddErrorsToTracking < ActiveRecord::Migration[5.0]
  def change
    add_column :trackings, :errors, :integer
  end
end
