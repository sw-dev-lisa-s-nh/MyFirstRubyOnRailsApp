class UserInstrument < ApplicationRecord 
    belongs_to :instrument, optional: true 
    belongs_to :user, optional: true

    validates :instruments_id, presence: true
    validates :users_id, presence: true
end
