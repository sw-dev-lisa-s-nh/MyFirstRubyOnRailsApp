class InstrumentController < ApplicationController
    
    def get
        @instrument = Instrument.all
    end

end