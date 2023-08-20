class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :priority
      t.boolean :status
      t.string :category
      t.references :user

      t.timestamps
    end
  end
end
