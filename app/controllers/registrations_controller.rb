class RegistrationsController < ApplicationController

    def new
        @user = User.new
        @user_instrument = UserInstrument.new
    end  

    def create
        # Is the status parameter a valid status?
        if ([:musician, :planner, :admin].include? params[:user][:role].to_sym)  
            @user = User.create(user_params)             
            if  (@user.save)
                @instrument = Instrument.find_by(id: @user.instrument_id)
                user_instrument = UserInstrument.new(users_id: @user.id,  instruments_id: @user.instrument_id)
                user_instrument.save! 
                redirect_to get_all_users_path, notice: "Successfully created user account"
            else
                render :new, alert: "User not saved"
                #redirect_to sign_up_path, alert: "Role not valid"
            end
        else
            redirect_to sign_up_path, alert: "Role not recognized -- please enter a valid role"
        end
    end

    def user_params   
        params.require(:user).permit(:email, :password, :password_confirmation,:first_name,:last_name,:instrument_id,:role)
    end

end