# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
    # validates :course_id, presence: true
    # validates :student_id, presence: true

    belongs_to :user,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: :User
 
    belongs_to :course,
    foreign_key: :course_id,
    primary_key: :id,
    class_name: :Course
end
