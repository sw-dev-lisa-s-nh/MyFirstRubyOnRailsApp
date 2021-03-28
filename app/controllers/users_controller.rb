class UsersController < ApplicationController
   
    def get
       @users = User.all
       @instruments = Instrument.all
    end


end