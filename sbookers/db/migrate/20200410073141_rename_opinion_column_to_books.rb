class RenameOpinionColumnToBooks < ActiveRecord::Migration[5.2]
  def change
  	rename_column :book, :opinion, :body
  end
end
