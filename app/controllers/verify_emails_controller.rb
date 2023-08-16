class VerifyEmailsController < ApplicationController
    def verify_email
        @user = User.find_by(verification_token: params[:token])
      
        if @user
          @user.update(verification_token: nil, verified: true)
          flash[:success] = 'Email verified successfully!'
          redirect_to root_path
        else
          flash[:alert] = 'Invalid verification token.'
          redirect_to root_path
        end
      end
      
end
