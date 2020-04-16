class User < ApplicationRecord 
    validates :email, presence: true
    
    has_many :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :ShortenedUrl

end