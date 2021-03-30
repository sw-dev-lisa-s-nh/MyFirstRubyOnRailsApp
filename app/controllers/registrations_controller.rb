class RegistrationsController < ApplicationController

    def new
        @user = User.new
    end  

    def create
            @user = User.new(user_params)   
             # Is the status parameter a valid status?
            if ([:musician, :planner, :admin].include? params[:user][:role].to_sym)                
                if  @user.save
                    #store user_instrument record here
                    user_instrument = UserInstrument.new(users_id: @user.id,  instruments_id: @user.instrument_id)
                    user_instrument.save
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