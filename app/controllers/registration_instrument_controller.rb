class RegistrationInstrumentController < ApplicationController
    def new
        @instrument = Instrument.new
    end

    def create
        @instrument = Instrument.new(instrument_params)
        if @instrument.save
            redirect_to root_path, notice: "Successfully created new instrument"
        else
            render :new
        end    
    end

    def instrument_params
        params.require(:instrument).permit(:name)
    end
end