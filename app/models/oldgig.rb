class Gig < ApplicationRecord
  belongs_to :instrument    
  validates :name, presence: true

end
