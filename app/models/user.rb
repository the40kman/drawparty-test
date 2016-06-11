class User < ActiveRecord::Base
    # Checks username and email are not blank 
    validates :username, presence: true
    validates :email, presence: true
    
    #
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end