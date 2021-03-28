class RegistrationsController < ApplicationController

    def new
        @user = User.new
    end  

    def create
            user = User.new(user_params)     
            if  user.save
                #store user_instrument record here
                user_instrument = UserInstrument.new(users_id: user.id,  instruments_id: user.instrument_id)
                user_instrument.save
                redirect_to get_all_users_path, notice: "Successfully created account"
            else
                render :new
            end
    end

    def user_params   
        params.require(:user).permit(:email, :password, :password_confirmation,:first_name,:last_name,:instrument_id)
    end
end