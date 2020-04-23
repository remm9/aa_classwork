class ArtworksController < ApplicationController

    def index
        # render plain: "I'm in the index action!"
        if params[:user_id]
            @artworks = Artwork.all
        else
            render json: @artworks
        end
    end

    def create
        #debugger
        @artworks = Artwork.new(artwork_params)
        if @artworks.save 
            render json: @artworks
        else 
            render json: @artworks.errors.full_messages, status: 422
        end
    end

    def show 
        #debugger
        @artworks = Artwork.find(params[:id])
        render json: @artworks
    end

    def update
        @artworks = Artwork.find(params[:id])
        if @artworks.update(artwork_params)
            redirect_to artworks_url(artwork_params)
        else
            render json: @artworks.errors.full_messages, status: 422
        end

    end

    def destroy
        @artworks = Artwork.find(params[:id])
        @artworks.destroy
        redirect_to artworks_url
    end

    def artwork_params
        params.require(:params_hash).permit(:title, :image_url, :artist_id)
    end

    # params_hash is a top level key -> see server log in terminal 
    # Postman query request for each key: params_hash[title], params_hash[image_url], params_hash[artist_id]        

end 