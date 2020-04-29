require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    subject(:user) { User.new(email: "apple@ya.com", password: "") }

    describe "GET #new" do
        it "renders the new template" do
        get :new, {}
        expect(response).to render_template("new")
        end
    end

    describe "POST #create" do
        context "with invalid params" do
            it "validates the presence of the user's email and password" do
            post :create, params: { user: {title: "this is invalid email/password"} }
            expect(response).to render_template("new")
            expect(flash[:errors]).to be_present
            end
        end

        it "validates that the password is at least 6 characters long" do
            post :create, params: { user: {email: "apple@ya.com", password: "short"} }
            expect(response).to render_template("new")
            expect(flash[:errors]).to be_present
        end

        context "with valid params" do
            it "redirects user to bands index on success" do
            post :create, params: { user: { email: "apple@ya.com", password: "password" } }
            expect(response).to redirect_to(users_url(user.id))
            end
        end
    end

end
