# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:session_token)}
  it {should validate_presence_of(:password_digest)}
  it {should validate_length_of(:password).is_at_least(6)}

  #it {should have_many(:goals)}
  
  describe "uniqueness" do 
    before :each do 
      create :user
    end
    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:session_token)}
  end

  describe "::find_by_credentials" do 
    # let(:user){User.create!(username: "larry", password: "ripple")}    
    # it "should return user with given credentials" do 
    #   expect(User.find_by_credentials("ben", "jeffrey")).to eq(User.first)
    # end
    # it "should return nil if no user exists" do 
    #   expect(User.find_by_credentials("ben", "effrey")).to be nil
    # end
    let!(:user){User.create!(username: "jerry", password: "ripple")}    
    it "should return user with given credentials" do 
      expect(User.find_by_credentials("jerry", "ripple")).to eq(user)
    end
    it "should return nil if no user exists" do 
      expect(User.find_by_credentials("ben", "effrey")).to be nil
    end

  end



# describe ".find_by_credentials" do
#     before :each do 
#       create :user 
#     end
#   it "returns user given good credentials" do
#     expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
#   end
#   it "returns nil given bad credentials" do
#     expect(User.find_by_credentials("jonathan@fakesite.com", "bad_password")).to eq(nil)
#   end
# end
end