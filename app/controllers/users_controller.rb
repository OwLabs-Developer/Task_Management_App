class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def show ## To display user details
        @user = User.find(params[:id]) 
    end

    def new ## To create new user from input form
        @user = User.new
    end

    def create ## Handle user creation account and save to database
        @user = User.new(user_params)
        if @user.save
            redirect_to root_path, notice: "Account create successful."

        else
            render :new
        end
    end

    def edit ## retrive current user details to be edit
    end

    def update ## reupdate current user detail to latest update
        if @user.update(user_params)
            redirect_to root_path, notice: "Details has been up to date."

        else
            render :edit
        end
    end

    def destroy ## Delete user account
        @user = User.destroy
        redirect_to root_path, notice: "Account has been DELETED"
    end

private

def user_params
    params.require(:user).permit(:username, :email, :password_digest, :profile_information, :preferences)
end

def set_user
    @user = User.find(params[:id])
end

end
