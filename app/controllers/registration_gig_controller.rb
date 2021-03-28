class RegistrationGigController < ApplicationController
    def new
        @gig = Gig.new
    end  

    def create
            gig = Gig.new(gig_params)
            if gig.save
                # store gig_instrument record here!
                gig_instrument = GigInstrument.new(gigs_id: gig.id, instruments_id: gig.instrument_id)
                gig_instrument.save
                redirect_to get_all_gigs_path, notice: "Successfully created gig"
            else
                render :new
            end
    end

    def gig_params
        params.require(:gig).permit(:name, :description, :start_time, :duration, :genre, :date, :address, :phone, :salary, :status, :instrument_id)
    end
end