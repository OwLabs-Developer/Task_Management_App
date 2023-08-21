class AddResetTokenExpiresAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reset_token_expires_at, :datetime
  end
end
