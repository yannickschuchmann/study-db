class AddRequiredToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :required, :boolean, default: true
  end
end
