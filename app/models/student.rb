class Student < ApplicationRecord
	before_save { self.email = email.downcase }
	regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, length: { maximum: 255 }, format: { with: regex }, uniqueness: { case_sensitive: false}

	has_secure_password
	validates :password, presence: true, length: { minimum: 3 }, allow_nil: true
end
