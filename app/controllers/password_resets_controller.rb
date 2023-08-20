require 'aws-sdk-ses'

class PasswordResetsController < ApplicationController
  def new
    # Render the password reset request form (where users enter their email).
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      # Generate the password reset token for the user
      user.generate_password_reset_token

      # Create an instance of UserMailer and send the email
      UserMailer.password_reset_instructions(user).deliver_now

      flash[:success] = "Password reset instructions sent to your email."
      redirect_to new_session_path
    else
      flash[:danger] = "Email not found."
      render :new
    end
  end

  def edit
    @user = User.find_by_password_reset_token(params[:id])
  
    if @user && @user.password_reset_token_valid?
      # Render the password reset form.
    else
      flash[:danger] = "Invalid or expired password reset link."
      redirect_to new_session_path
    end
  end
  

  def update
    @user = User.find_by_password_reset_token(params[:id])
    if @user && @user.password_reset_token && @user.reset_token_used_at.nil?
      puts "Reset token: #{@user.password_reset_token}"
      puts "Reset token used at: #{@user.reset_token_used_at}"
      # Update the user's password and mark the token as used
      if @user.update(password_params)
        @user.update(reset_token_used_at: Time.now)
        # Password has been successfully reset.
        flash[:success] = "Password has been reset. Please log in with your new password."
        redirect_to new_session_path
      else
        flash[:danger] = "Password reset failed. Please try again."
        render :edit
      end
    else
      flash[:danger] = "Invalid or expired password reset link."
      redirect_to new_session_path
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
