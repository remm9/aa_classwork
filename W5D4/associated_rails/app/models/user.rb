# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :name, presence: true
    
    has_many :enrolled_courses,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: :Enrollment
end
