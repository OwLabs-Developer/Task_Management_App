class ChangeCategoryIdToNullable < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :category_id, :integer, null: true
  end
end
