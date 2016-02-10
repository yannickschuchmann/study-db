class AddComputerUsageToParticipant < ActiveRecord::Migration[5.0]
  def change
    add_column :participants, :computer_usage, :integer
  end
end
