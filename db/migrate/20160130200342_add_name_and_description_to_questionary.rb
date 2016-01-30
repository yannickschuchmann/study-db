class AddNameAndDescriptionToQuestionary < ActiveRecord::Migration[5.0]
  def change
    add_column :questionaries, :name, :string
    add_column :questionaries, :description, :string
  end
end
