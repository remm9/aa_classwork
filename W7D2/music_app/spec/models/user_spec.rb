require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User, type: :model do

  subject(:user) { User.new(email: "apple@ya.com", password: "hunter2") }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }

  describe "methods" do
    describe "is_password?" do
      it "should match password with password_digest" do

      end
    end
  end

  describe "class_methods" do
    describe "::find_by_credetials" do
      it "should locate user by email" do
        user_1 = User.create(email: "apple@ya.com", password: "hunter2")
        expect(User.find_by_credentials("apple@ya.com", "hunter2")).to eq(user_1)
      end
    end
    describe "::generate_random_token" do
      it "should generate random token" do

      end
    end
  end
end
