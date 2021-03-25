class UsersController < ApplicationController

    def get
       @user = User.all
    end


end