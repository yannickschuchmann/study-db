class RenameToAdditional < ActiveRecord::Migration[5.0]
  def change
    rename_column :professions, :additionals, :additional
  end
end
