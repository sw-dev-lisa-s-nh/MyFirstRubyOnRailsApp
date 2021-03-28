class GigController < ApplicationController

    def get
        @gigs = Gig.all
        @instruments = Instrument.all
        @gig_instruments = GigInstrument.all
    end

    def delete
       Gig.delete.by(:id)
    end
end