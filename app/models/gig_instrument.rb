class GigInstrument < ApplicationRecord
    belongs_to :gig, optional: true
    belongs_to :instrument, optional: true

    enum gig_instrument_status: [:planned, :available, :requested, :hired, :closed, :cancelled]
    STATUS_OPTIONS = %w(planned available requested hired closed cancelled) 
    validates :gig_instrument_status, :inclusion => {:in => STATUS_OPTIONS}
end
