class RegistrationGigController < ApplicationController
    def new
        @gig = Gig.new
    end  

    def create
        @gig = Gig.new(gig_params)
        if @gig.save
            redirect_to root_path, notice: "Successfully created gig"
        else
            render :new
        end
    end

    def gig_params
        params.require(:gig).permit(:name, :description, :start_time, :duration, :genre, :date, :address, :phone, :salary, :status)
    end
end