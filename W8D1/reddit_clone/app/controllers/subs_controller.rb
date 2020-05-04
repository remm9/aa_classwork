class SubsController < ApplicationController

    before_action :ensure_logged_in, only: [:new, :create, :edit, :update]

    def index
        @subs = Sub.all
        render :index
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end
    
    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :new, status: 422
        end
    end

    def edit
       @sub = Sub.find(params[:id]) 
       if @sub.moderator_id == current_user.id
            render :edit
       else
            redirect_to new_session_url
       end
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit, status:422
        end
    end

    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
