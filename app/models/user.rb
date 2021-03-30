class User < ApplicationRecord
  enum role: [:musician, :planner, :admin]

  ROLE_OPTIONS = %w(musician planner admin) 

  validates :role, :inclusion => {:in => ROLE_OPTIONS}

  belongs_to :instrument
 
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }

end


