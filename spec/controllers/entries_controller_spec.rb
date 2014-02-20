require 'spec_helper'

describe EntriesController do
  describe "entries#main" do

    before do
      get :main
    end

    it { expect(response.status).to be(200) }

  end

  describe "entries#index" do
    let(:user)   { create(:user)  }
    let!(:entry1) { create(:entry) }
    let!(:entry2) { create(:entry) }
    let!(:entry3) { create(:entry) }

    before do
      get :index, user_id: user, access_token: user.access_token, format: :json
    end

    describe "json response" do
      render_views
      it "should recieve a correct json response" do
        @body = JSON.parse(response.body)

        expect( @body.count ).to be(3)
        expect( @body.first["id"] ).to eq(entry1.id)
        expect( @body.first["started_at"] ).to eq(entry1.started_at.to_formatted_s(:short))
        expect( @body.first["ended_at"] ).to eq(entry1.ended_at.to_formatted_s(:short))
      end
    end

    it { expect(response.status).to be(200) }
  end

  describe "entries#create" do
    let(:user)   { create(:user)  }

    before do
      post :create, user_id: user, access_token: user.access_token, format: :json
    end

    it { expect(Entry.all.count).to be(1) }
    it { expect(response.status).to be(200) }

    describe "json response" do
      render_views
      it "should recieve a correct json response"
    end
  end

  describe "entries#update" do
    let(:entry) { create(:entry, ended_at: nil) }

    before do
      @time = Time.now
      put :update, user_id: entry.user, id: entry, access_token: entry.user.access_token, ended_at: @time, format: :json
    end

    it { expect(assigns(:entry)).to eq(entry) }
    it { expect(assigns(:entry).ended_at).to eq(@time) }
    it { expect(response.status).to be(200) }

    describe "json response" do
      render_views
      it "should recieve a correct json response"
    end
  end

  describe "entries#destroy" do
    let(:entry) { create(:entry, ended_at: nil) }

    before do
      delete :destroy, user_id: entry.user, id: entry, access_token: entry.user.access_token, format: :json
    end

    it { expect(assigns(:entry)).to eq(entry) }
    it { expect(Entry.all.count).to be(0)     }
    it { expect(response.status).to be(200)   }

    describe "json response" do
      render_views
      it "should recieve a correct json response"
    end
  end

end
