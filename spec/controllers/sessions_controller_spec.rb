require 'spec_helper'

describe SessionsController do

  describe "sessions#create" do
    let(:user) { create(:user, access_token: nil) }

    it "should assign a token upon succesful authentication" do
      post :create, email: user.email, password: user.password, format: :json

      expect(assigns(:user)).to eq(user)
      expect(assigns(:user).access_token).to be_present
      expect(assigns(:errors)).to eq([])

      expect(response.status).to be(200)
    end

    it "should respond with an error upon failed authentication" do
      post :create, email: user.email, password: nil, format: :json

      expect(assigns(:user)).to eq(user)
      expect(assigns(:user).access_token).to_not be_present
      expect(assigns(:errors)).to eq(["authentication failed"])

      expect(response.status).to be(401)
    end
  end

  describe "sessions#destroy" do
    let(:user) { create(:user) }

    context 'when logged in' do
      it "should remove the access_token from the user" do
        delete :destroy, id: user.id, access_token: "myToken", format: :json

        expect(assigns(:current_user)).to eq(user)
        expect(assigns(:current_user).access_token).to_not be_present
        expect(response.status).to be(200)
      end
    end

    context 'when logged out' do
      it "should respond with an error upon failed authentication" do
        delete :destroy, id: user.id, access_token: "asdf", format: :json

        expect(assigns(:errors)).to eq(["authentication failed"])
        expect(response.status).to be(401)
      end
    end

  end

end
