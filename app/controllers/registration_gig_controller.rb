class RegistrationGigController < ApplicationController
    def new
        @gig = Gig.new
    end  

    def create
            @gig = Gig.new(gig_params)
            if @gig.name != nil
                if ([:planned, :available].include? @gig.status.to_sym)
                    if @gig.save
                        # store gig_instrument record here!
                        gig_instrument = GigInstrument.new(gigs_id: @gig.id, instruments_id: @gig.instrument_id)
                        gig_instrument.save
                        redirect_to get_all_gigs_path, notice: "Successfully created gig"
                    else
                        render :new
                    end
                else
                    redirect_to gig_path, notice: "Status not valid for this request!"
                end
            else
                redirect_to gig_path, notice: "Name field required"
            end
    end

    def gig_params
        params.require(:gig).permit(:name, :description, :start_time, :duration, :genre, :date, :address, :phone, :salary, :status, :instrument_id, :planner_id)
    end
end