class UsersController < ApplicationController

    # To create new user from input form
    def new
        @user = User.new
    end

    # Handle user creation account and save to database
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, success: "Account has been created successfully!"
        else
            redirect_to new_user_path, danger: "Please key in all of the details"
        end
    end

    #Edit user profile
    def edit
        @user = current_user
    end

    #Handle edit user account
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
