class Gig < ActiveRecord::Base
    # belongs_to :instrument
    validates :name, presence: true
end
