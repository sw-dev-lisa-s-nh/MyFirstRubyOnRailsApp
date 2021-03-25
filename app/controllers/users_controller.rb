class UsersController < ApplicationController

    def index
       @users = User.first
    end

end