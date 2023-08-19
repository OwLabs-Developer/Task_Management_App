class AddVerificationTokenExpiresAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :verification_token_expires_at, :datetime
  end
end
