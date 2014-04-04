require 'spec_helper'
require 'feedshub/feeds/git_feeds_handler'

describe Feedshub::FeedsHelper do

  describe 'github_feeds' do

    before :each do
      links =["File://#{Rails.root}/spec/resources/member.atom"]
      GitFeedsHandler.fetch_and_create_feeds_enrties(links)
      ENV.stub(:[]).with("github_feeds_number").and_return("10")
    end

    context 'check content correctness' do

      it 'has to render partial github_feeds with atom entries' do
        expect(github_feeds 20).to match /vairix-dfernandez/
      end
    end
  end
end