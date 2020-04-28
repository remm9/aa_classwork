class SessionsController < ApplicationController 

    def new 
        render :new
    end

    def create
        #debugger
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            #session[:session_token] = @user.reset_session_token!
            log_in_user!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = ["wrong email/password combination"]
            render :new
        end
    end

    def destroy
        #current_user = User.find_by(session_token: session[:session_token])
        current_user.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url
    end

end