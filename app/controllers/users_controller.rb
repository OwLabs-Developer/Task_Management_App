class UsersController < ApplicationController
    require 'securerandom'

    # To create new user from input form
    def new
        @user = User.new
    end

    # Handle user creation account and save to the database
    def create
        @user = User.new(user_params)
        
        if @user.save
            UserMailer.welcome_email(@user).deliver_now
          
          redirect_to root_path, success: 'Account created successfully! Please check your email to verify your address.'
        else
          redirect_to new_user_path, danger: "Please key in all of the details"
        end
      end
      
      

    # def verify_email
    #     @user = User.find_by(verification_token: params[:token])

    #     if @user
    #         @user.update(verification_token: nil, verified: true)
    #         redirect_to root_path, success: 'Account created successfully! Please check your email to verify your address.'
    #     else
    #         redirect_to root_path, alert: 'Invalid verification token.'
    #     end
    # end
  

    # Edit user profile
    def edit
        @user = current_user
    end

    # Handle edit user account
    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to root_path, success: "Account has been updated successfully!"
        else
            redirect_to edit_user_path, info: "Your account is not fully updated!"
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
