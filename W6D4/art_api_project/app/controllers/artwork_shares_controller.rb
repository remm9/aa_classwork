class ArtworkSharesController < ApplicationController

    def index
        # render plain: "I'm in the index action!"
        @artwork_shares = ArtworkShare.all
        render json: @artwork_shares
    end

    def destroy 
        @artwork_shares = ArtworkShare.find(params[:id])
        @artwork_shares.destroy 
        redirect_to artwork_shares_url  #requires a getter route(index)
    end 

    def create
        @artwork_shares = ArtworkShare.create(artwork_shares_params)
        if @artwork_shares.save
            render json: @artwork_shares
        else
            render json: @artwork_shares.errors.full_messages, status: 422
        end
    end

    def artwork_shares_params
        params.require(:params_hash).permit(:artwork_id, :viewer_id)
    end
end 