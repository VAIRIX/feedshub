require 'spec_helper'

describe Feedshub::FeedsController do
  routes { Feedshub::Engine.routes }

  describe 'github_feeds' do

    before :each do
      links =["File://#{Rails.root}/spec/resources/member.atom"]
      GitFeedsHandler.fetch_and_create_feeds_enrties(links)
    end

    context 'check content correctness' do
      render_views

      it 'has to render partial github_feeds with atom entries' do
        get :github_feeds
        expect(response.body).to match /vairix-dfernandez/
      end
    end

    context 'check status' do
      it 'response ok' do
        get :github_feeds
        expect(response).to be_succes
      end
      it 'has to assign @entries' do
        get :github_feeds
        expect(assigns(:entries).size).to eq(Feedshub::GithubFeedEntry::LAST_ADDED)
      end
    end
  end
end