class AddRequiredToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :required, :boolean, default: true
  end
end
