class Gig < ApplicationRecord
    enum status: [:planned, :available, :requested, :hired, :closed, :cancelled]

    STATUS_OPTIONS = %w(planned available requested hired closed cancelled) 

    validates :status, :inclusion => {:in => STATUS_OPTIONS}

end
