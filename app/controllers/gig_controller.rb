class GigController < ApplicationController

    def new
        @gig = Gig.new
    end  

    def update     
       @gig = Gig.new
       
       if (@gig = Gig.find_by(id: params[:gig][:id]))
          if @user = User.find_by(id: params[:gig][:musician_id])  
            # Check if musician requesting Gig plays instrument needed for the Gig
            if (@user.instrument_id == @gig.instrument_id) 
                # Is the status parameter a valid status?
                if ([:planned, :available, :requested, :hired, :closed, :cancelled].include? params[:gig][:status].to_sym)
                    # If the input status is requested, the gig status MUST be available.
                    if (params[:gig][:status].to_sym == :requested)
                        if (@gig.status.to_sym == :available)
                            if @gig.update(status: params[:gig][:status],  musician_id: params[:gig][:musician_id])
                                redirect_to get_all_gigs_path, notice: "Successfully updated gig"                   
                            else
                                redirect_to update_gig_path, notice: "Gig NOT updated"
                            end
                        else
                            redirect_to update_gig_path, notice: "Requested Gig is not available"
                        end
                    else
                        if (@gig.planner_id == params[:gig][:planner_id].to_i)
                            if @gig.update(status: params[:gig][:status],  musician_id: params[:gig][:musician_id])
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
            else 
                redirect_to update_gig_path, notice: "Musician does NOT play requested instrument"
            end
          # if no musician_id is entered
          else
            # and if planner is valid for this gig
            if (@gig.planner_id == params[:gig][:planner_id].to_i)
                # update status
                if @gig.update(status: params[:gig][:status])
                    redirect_to get_all_gigs_path, notice: "Successfully updated gig"                   
                else
                    redirect_to update_gig_path, notice: "Gig NOT updated"
                end
            else
                redirect_to update_gig_path, notice: "Only a planner can update this status"
            end
          end
        else
            redirect_to update_gig_path, notice: "gig_id not valid"
        end
    end 

    def get
        @gigs = Gig.all
        @instruments = Instrument.all
        @gig_instruments = GigInstrument.all
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