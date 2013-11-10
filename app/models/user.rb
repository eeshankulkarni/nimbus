class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    has_many :reviews, dependent: :destroy
    has_many :ratings
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:   true,
    format:     { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }
    mount_uploader :dp, DpUploader
    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end
    
    def User.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
    end
    
    def self.search(query)
    where("name like ?", "%#{query}%")
end
    private
    
    def create_remember_token
        self.remember_token = User.encrypt(User.new_remember_token)
    end
    
    
end
