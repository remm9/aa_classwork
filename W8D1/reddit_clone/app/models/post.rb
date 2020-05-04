class Post < ApplicationRecord

    validates :title, :sub_id, :author_id, presence:true
    validates :title, uniqueness:true

    has_many :post_subs, foreign_key: :post_id
    belongs_to :user, foreign_key: :author_id

end
