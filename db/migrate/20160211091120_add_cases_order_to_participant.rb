class AddCasesOrderToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :cases_order, :string
  end
end
