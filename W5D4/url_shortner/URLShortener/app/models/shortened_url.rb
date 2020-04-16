class ShortenedUrl < ApplicationRecord 
    validates :short_url, presence: true
    
    belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User
end