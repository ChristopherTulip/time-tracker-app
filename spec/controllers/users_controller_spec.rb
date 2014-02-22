require 'spec_helper'

describe UsersController do

  describe "users#create" do
    before do

    end

    it "should create a new user and log him in" do
      post :create, format: :json, attributes_for(:user)

      expect(User.all.count).to be(1)
      expect(assigns(:current_user).access_token).to be_present
      expect(response.status).to be(200)
    end

    describe "json response" do
      render_views
      it "should recieve a correct json response"
    end
  end

  describe "users#update" do
    let(:user) { create(:user) }

    before do
      @email = "asdf@jkl.com"
      put :update, id: user, access_token: user.access_token, email: @email, format: :json
    end

    it { expect(assigns(:current_user)).to eq(user) }
    it { expect(assigns(:current_user).email).to eq(@email) }
    it { expect(response.status).to be(200) }

    describe "json response" do
      render_views
      it "should recieve a correct json response"
    end
  end

  describe "users#destroy" do
    let(:user) { create(:user }

    before do
      delete :destroy, id: user, access_token: user.access_token, format: :json
    end

    it { expect(assigns(:current_user)).to eq(user) }
    it { expect(User.all.count).to be(0)      }
    it { expect(response.status).to be(200)   }

    describe "json response" do
      render_views
      it "should recieve a correct json response"
    end
  end


end
