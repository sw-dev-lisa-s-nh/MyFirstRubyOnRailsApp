class Instrument < ActiveRecord::Base
    has_many :user
    has_many :gig
    validates :name, presence: true
end