class AddResetTokenUsedAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reset_token_used_at, :datetime
  end
end
