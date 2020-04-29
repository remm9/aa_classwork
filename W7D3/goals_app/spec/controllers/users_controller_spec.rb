require 'rails_helper'


RSpec.describe UsersController, type: :controller do

  subject (:jasmine) { User.create!(username: 'jasmine', password: 'abcdef') }

  describe 'get#new' do
    it 'renders form to make a new user' do

      get :new 

      expect(response).to render_template(:new)
    end
  end

  describe 'get#show' do 

    it 'displays user page' do 
    
      allow(controller).to receive(:current_user){jasmine}
      get :show, params: {id: jasmine.id}

      fetched_user = controller.instance_variable_get(:@user)
      expect(fetched_user).to eq(User.find(jasmine.id))
      expect(response).to render_template(:show)
    end
  end

  describe 'post#create' do

    let(:valid_params) { 
      { user: { 
          username: 'person', 
          password: 'password'
        } 
      } 
    }

    let(:invalid_params) {
      { user: {
          username: 'person',
          password: 'pass'
        }
      }
    }

    context 'with valid params' do
      it 'creates the user' do
        post :create, params: valid_params
        # sends a post request to create a new user using the valid params we defined

        expect(User.exists?(User.last.id)).to be true
      end

      it 'redirects to the user show page' do
        post :create, params: valid_params

        expect(response).to redirect_to(user_url(User.last.id))
      end
    end

    context 'with invalid params' do
      before :each do
        post :create, params: invalid_params
      end

      it 'redirects to new_user_url' do
        expect(response).to render_template(:new)
        expect(flash[:errors]).to eq(["Password is too short (minimum is 6 characters)"])
        expect(response).to have_http_status(422)
      end

      it 'adds errors to flash' do
        expect(flash[:errors]).to be_present
      end
    end

  end
end