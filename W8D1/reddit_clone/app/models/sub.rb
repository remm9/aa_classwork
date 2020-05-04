class Sub < ApplicationRecord

    validates :title, :description, presence: true
    validates :title, :description, uniqueness: true

    has_many :post_subs, foreign_key: :sub_id
    has_many :posts, through: :post_subs, source: :post
    

    belongs_to :user, foreign_key: :moderator_id



end
