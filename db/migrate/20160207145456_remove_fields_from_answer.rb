class RemoveFieldsFromAnswer < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :required, :boolean
    remove_column :answers, :type, :string
  end
end
