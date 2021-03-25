class UsersController < ApplicationController
   
    def get
       @users = User.all
    end


end