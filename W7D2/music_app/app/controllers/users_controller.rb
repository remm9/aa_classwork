class UsersController < ApplicationController 

    def new 
        render :new
    end

    def show
        render :show
    end


    def create
        #debugger
        @user = User.new(user_params)
        if @user.save
            #session[:session_token] = @user.reset_session_token!
            log_in_user!(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = @user.errors.full_messages 
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end

end