class GigController < ApplicationController

    def new
        @gig = Gig.new
    end  

    def update     
       @gig = Gig.new
       @gig = Gig.where(id: params[:gig][:id])
        #FUTURE:  check if musician_requested matches instrument of the Gig
        if @gig.update(status: params[:gig][:status],  musician_id: params[:gig][:musician_id])
            redirect_to get_all_gigs_path, notice: "Successfully updated gig"                   
        else
            redirect_to update_gig_path, notice: "Gig NOT updated!"
        end
    end 

    def get
        @gigs = Gig.all
        @instruments = Instrument.all
        @gig_instruments = GigInstrument.all
    end


    def delete
       Gig.delete.by(:id)
    end
end