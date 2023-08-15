class SessionsController < ApplicationController
    
    def new
    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, success: "Logged in successfully."
        else
            redirect_to new_session_path, danger: "Invalid username or password"
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path, primary: "Logged out"
    end

end
