class GigController < ApplicationController

    def new
        @gig = Gig.new
    end  

    def update     
       @gig = Gig.new
       userPlaysRequestedInstrument = false
       if (@gig = Gig.find_by(id: params[:gig][:id]))
          if (@user = User.find_by(id: params[:gig][:musician_id]))
                # Find the database record for the requested instrument
                @instrument = Instrument.find_by(id: params[:gig][:instrument_id])

                # Get all requesting User's records from UserInstrument
                @user_instruments = UserInstrument.where(users_id: @user.id)

                # Check if musician requesting Gig plays instrument needed for the Gig
                # Check to see if User plays requested instrument
                @user_instruments.each do |user_instrument|
                    if user_instrument.instruments_id == @instrument.id 
                        userPlaysRequestedInstrument = true
                    end
                end
                
                # Get all  GigInstruments for this GigId
                @gig_instruments = GigInstrument.where(gigs_id: @gig.id)

                # if User does play the instrument that is requested
                if (userPlaysRequestedInstrument == true)
                # Loop through all the instruments requested for a particular gig!
                #   Check to see if the @gig_instrument.instruments_id matches the instrument passed in)
                  @gig_instruments.each do |gig_instrument|
                     # if (@user.instrument_id == @gig.instrument_id) 
                    if (gig_instrument.instruments_id == @instrument.id)
                    # Is the status parameter a valid status?
                        if ([:planned, :available, :requested, :hired, :closed, :cancelled].include? params[:gig][:status].to_sym)
                            # If the input status is requested, the gig status MUST be available.
                            if (params[:gig][:status].to_sym == :requested)
                                if (gig_instrument.gig_instrument_status.to_sym == :available)
                                    if gig_instrument.update(gig_instrument_status: params[:gig][:status],  musician_id: params[:gig][:musician_id])
                                        redirect_to get_all_gigs_path, notice: "Successfully updated gig"                   
                                    else
                                        redirect_to update_gig_path, notice: "Gig NOT updated"
                                    end
                                else
                                    redirect_to update_gig_path, notice: "Requested Gig is not available"
                                end
                            else
                                if (@gig.planner_id == params[:gig][:planner_id].to_i)
                                    if gig_instrument.update(gig_instrument_status: params[:gig][:status],  musician_id: params[:gig][:musician_id])
                                        redirect_to get_all_gigs_path, notice: "Successfully updated gig"                   
                                    else
                                        redirect_to update_gig_path, notice: "Gig NOT updated"
                                    end
                                else
                                    redirect_to update_gig_path, notice: "Only a planner can update this status"
                                end
                            end
                        else
                            redirect_to update_gig_path, notice: "Status requested is NOT a valid option"
                        end
                    end
                  end
                else
                    redirect_to update_gig_path, notice: "User does not play requested Instrument"
                end
          # if no musician_id is entered
          else
            # and if planner is valid for this gig
            if (@gig.planner_id == params[:gig][:planner_id].to_i)
                # Update Gig_instruments & Gig Status
                # Get all GigInstruments for this GigId
                @gig_instruments = GigInstrument.where(gigs_id: @gig.id)
                @gig_instruments.each do |gig_instrument| 
                    if (!(gig_instrument.update(gig_instrument_status: params[:gig][:status])))
                        redirect_to update_gig_path, notice: "Gig NOT updated"
                    end
                end
                @gig.update(status: params[:gig][:status])
                redirect_to get_all_gigs_path, notice: "Successfully updated gig"                   
            else
                redirect_to update_gig_path, notice: "Only a planner can update this status"
            end
          end
        else
            redirect_to update_gig_path, notice: "gig_id not valid"
        end
    end 

    def get
        @gig_instruments = GigInstrument.all
        @gigs = Gig.all
        @instruments = Instrument.all
    end

    def getavailable
        @gigs = Gig.where(status: "available")
        @instruments = Instrument.all
        @gig_instruments = GigInstrument.all
    end

    def getby
        @gigs = Gig.where(status: "available")

        #if (:status == "available") 
        #    @gigs = Gig.where(status: "available")
        #else
        #    if (:input == "instrument")
        #        @gigs = Gig.where(id: :instrument_id)
        #    else 
        #        if (:input == "user")
                    # @gig_instruments = GigInstrument.where(id: :user_id)
                    # @gig_instruments.each do |gig_instrument|
                    # ??? Will this work? ??? 
         #       end
         #   end
        #  end
        @instruments = Instrument.all
        @gig_instruments = GigInstrument.all
    end

    def addinstrumentsgigindex
        @gigs = Gig.all
        @instruments = Instrument.all
        @gig_instruments = GigInstrument.all
    end

    def addinstrumentsgig
        @gig = Gig.new
        if (@gig = Gig.find_by(id: params[:id]))
            # store gig_instrument record here if instruments exist
            @instrument = Instrument.find_by(id: params[:instrument_id])
            if @instrument != nil
                gig_instrument = GigInstrument.new(gigs_id: @gig.id, instruments_id: @instrument.id, gig_instrument_status: @gig.status)
                gig_instrument.save! 
                redirect_to add_instruments_gig_path, notice: "Successfully added instrument to gig"
            else
                redirect_to add_instruments_gig_path, notice: "Instrument id not valid, id does not exist -- Use valid instrument"
            end
        else
            redirect_to add_instruments_gig_path, notice: "Gig id is not valid, id does not exist -- Use valid gig"
        end
    end


    def deleteindex
    end

    def delete
       @gig = Gig.new
       if (@gig = Gig.find_by(id: params[:id]))
        if (@gig.planner_id == params[:planner_id].to_i)
            @gig_instruments = GigInstrument.all
            @gig_instruments.each do |gig_instrument|
                if (gig_instrument.gigs_id == @gig.id)
                    GigInstrument.destroy(gig_instrument.id)
                end
            end
            Gig.destroy(params[:id].to_i)
            redirect_to get_all_gigs_path, notice: "Successfully deleted gig"
        else
            redirect_to delete_gig_path, notice: "Planner_id not valid -- gig not deleted"
        end
       else
            redirect_to delete_gig_path, notice: "gig_id not valid"
       end
    end
end