class Gig < ApplicationRecord
    has_many :gig_instruments
    has_many :instruments, :through => :gig_instruments

    validates :name, presence: true

    enum status: [:planned, :available, :requested, :hired, :closed, :cancelled]
    STATUS_OPTIONS = %w(planned available requested hired closed cancelled) 
    validates :status, :inclusion => {:in => STATUS_OPTIONS}

end
