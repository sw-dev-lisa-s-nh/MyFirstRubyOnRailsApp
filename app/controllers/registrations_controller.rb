class RegistrationsController < ApplicationController

    def new
        @user = User.new
        @user_instrument = UserInstrument.new
    end  

    def create
            @user = User.create(user_params)
             # Is the status parameter a valid status?
            if ([:musician, :planner, :admin].include? params[:user][:role].to_sym)                
                if  (@user.save)
                    @instrument = Instrument.find_by(id: @user.instrument_id)
                    user_instrument = UserInstrument.new(users_id: @user.id,  instruments_id: @user.instrument_id)
                    user_instrument.save! 
                    #@user_instrument = UserInstrument.new
                    #store user_instrument record here
                    #@user_instrument. = @instrument
                    #@user_instrument.user = @user
                    #@user_instrument.save
                    #@user.instruments.instrument_ids << @instrument.id
                    redirect_to get_all_users_path, notice: "Successfully created user account"
                else
                    render :new
                end
            else
                redirect_to sign_up_path, notice: "Role not valid"
            end
    end

    def user_params   
        params.require(:user).permit(:email, :password, :password_confirmation,:first_name,:last_name,:instrument_id,:role)
    end

end