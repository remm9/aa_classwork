class BandsController < ApplicationController

    def new
        render :new
    end

    def show
        @band = Band.find(params[:id])
        render :show
    end

    def create
        @band = Band.new(bands_params)
        if @band.save
            redirect_to bands_url(@band)
        else
            flash[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def destroy
        @band = Band.find(params[:id]) #?????? band or @band
        @band.destroy
        redirect_to bands_url
    end

    def edit 
        @band = Band.find(params[:id])
        render :edit
    end

    def update
        @band = Band.find(params[:id])
        if @band.update(bands_params)
            redirect_to bands_url(@band.id)
        else
            # flash[:errors] = @band.errors.full_messages
            render json: @band.errors.full_messages, status 422  #????? flash vs json 
        end
    end

    def bands_params
        params.require(:band).permit(:name)
    end

end
