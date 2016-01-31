class AddSheetOrderToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :sheet_order, :string
  end
end
