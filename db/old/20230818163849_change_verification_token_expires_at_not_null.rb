class ChangeVerificationTokenExpiresAtNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :verification_token_expires_at, false
  end
end
