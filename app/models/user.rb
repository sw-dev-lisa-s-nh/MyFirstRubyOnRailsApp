class User < ApplicationRecord
  has_many :user_instruments
  has_many :instruments, :through => :user_instruments
  
  validates :email, presence: true, uniqueness: true
  
  enum role: [:musician, :planner, :admin]
  ROLE_OPTIONS = %w(musician planner admin) 
  validates :role, :inclusion => {:in => ROLE_OPTIONS}
 
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }

end


