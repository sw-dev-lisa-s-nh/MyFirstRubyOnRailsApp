class GigController < ApplicationController

    def get
        @gig = Gig.all
    end

end