class User < ApplicationRecord
  require 'securerandom'

  # Associations
  has_many :tasks

  # Secure password
  has_secure_password

  # Validations
  validates_presence_of :username, :email, :password, :password_confirmation
  validates_uniqueness_of :username, :email

  # Callbacks
  before_create :set_verification_token_expires_at

  # Methods

  # Generate a new verification token with expiration
  def generate_verification_token
    new_token = SecureRandom.hex(20)
    new_expiry = Time.now + 300.seconds
    update_columns(
      verification_token: new_token,
      verification_token_expires_at: new_expiry
    )
    Rails.logger.info("Verification token and expiration time updated.")
    Rails.logger.info("New Token: #{new_token}")
    Rails.logger.info("New Expiry: #{new_expiry}")
  end

  # Check if user is verified
  def verified?
    verified  # Assuming 'verified' is a boolean attribute in the User model
  end

  # Check if verification token has expired
  def verification_token_expired?
    verification_token_expires_at.present? && verification_token_expires_at <= Time.now
  end

  private

  # Set verification token expiration time
  def set_verification_token_expires_at
    self.verification_token_expires_at = Time.now + 300.seconds
  end
end
