require 'spec_helper'

describe SessionsController do

  describe "sessions#create" do
    let(:user) { create(:user) }

    it "should assign a token upon succesful authentication" do
      post :create, email: user.email, password: user.password, format: :json

      expect(assigns(:user)).to eq(user)
      expect(assigns(:user).access_token).to be_present
      expect(assigns(:errors)).to eq([])
    end

    it "should respond with an error upon failed authentication" do
      post :create, email: user.email, password: nil, format: :json

      expect(assigns(:user)).to eq(user)
      expect(assigns(:user).access_token).to_not be_present
      expect(assigns(:errors)).to eq(["authentication failed"])
    end
  end

end
