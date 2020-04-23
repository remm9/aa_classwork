class UsersController < ApplicationController

    def index
        # render plain: "I'm in the index action!"
        @users = User.all
        render json: @users
    end

    def create
        #debugger
        @users = User.new(user_params)
        if @users.save 
            render json: @users
        else 
            render json: @users.errors.full_messages, status: 422
        end
    end

    def show 
        #debugger
        @users = User.find(params[:id])
        render json: @users
    end

    def update
        @users = User.find(params[:id])
        if @users.update(user_params)
            redirect_to users_url(user_params)
        else
            render json: @users.errors.full_messages, status: 422
        end

    end

    def destroy
        @users = User.find(params[:id])
        @users.destroy
        redirect_to users_url
    end

    def user_params
        params.require(:params_hash).permit(:username)
    end



end