class UsersController < ApplicationController
   
    def get
       @users = User.all
       @instruments = Instrument.all
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