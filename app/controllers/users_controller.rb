class UsersController < ApplicationController
   
    def get
       @users = User.all
       @instruments = Instrument.all
       @user_instruments = UserInstrument.all
    end

    def addinstrumentsuserindex
        @users = User.all
        @instruments = Instrument.all
        @user_instruments = UserInstrument.all
     end

    def addinstrumentsuser
        @users = User.all
        if (@user = User.find_by(id: params[:id]))
            # store user_instrument record here if instruments exist
            @instrument = Instrument.find_by(id: params[:instrument_id])
            if @instrument != nil
                user_instrument = UserInstrument.new(users_id: @user.id, instruments_id: @instrument.id)
                user_instrument.save! 
                redirect_to add_instruments_user_path, notice: "Successfully added instrument to user"
            else
                redirect_to add_instruments_user_path, notice: "Instrument id not valid, id does not exist -- Use valid instrument"
            end
        else
            redirect_to add_instruments_user_path, notice: "User id is not valid, id does not exist -- Use valid user"
        end
    end


    def deleteuser
    end

    def delete
       @user = User.new
       if (@user = User.find_by(id: params[:id]))
            # get rid of all associated records
            if (@user.role != :admin)
                @user_instruments = UserInstrument.all
                @user_instruments.each do |user_instrument|
                    if (user_instrument.users_id == @user.id)
                        UserInstrument.destroy(user_instrument.id)
                    end
                end
            end
            User.destroy(params[:id].to_i)
            redirect_to get_all_users_path, notice: "Successfully deleted user"
        else
            redirect_to delete_user_path, notice: "user_id not valid"
        end
    end

end