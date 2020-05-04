class PostsController < ApplicationController

    before_action :ensure_logged_in, except: [:show]
    #before_action :
    def new
        @post = Post.new
        #debugger
        render :new
    end

    def create
        @post = Post.new(post_params)
        @post.sub_id += params[:sub_id]
        @post.author_id = current_user.id        
        if @post.save
            redirect_to sub_url(@post.sub_id)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def destroy
        @post = Post.find(params[:id])
        if @post && @post.delete
            redirect_to subs_url
        end
    end

    def edit
        @post = Post.find(params[:id])
        if @post.author_id == current_user.id
            render :edit
        else
            redirect_to new_session_url 
        end
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post.update(post_params)
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
    end

    private 

    def post_params
        params.require(:post).permit(:title, :url, :content)
    end
end
