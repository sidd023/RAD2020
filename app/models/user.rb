class User < ApplicationRecord
    has_many :microposts, dependent: :destroy
    before_save { email.downcase! }
    validates :name,presence: true,length: {maximum:50},uniqueness: true
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email,presence: true,length: {maximum:255},format: {with:VALID_EMAIL_REGEX},uniqueness: {case_sensitive:false}
    has_secure_password
    validates :mobile,presence: true,length: {minimum:6}, :numericality => {:only_integer => true}
    before_save { self.email = email.downcase }
    
   

end
