require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }

  describe "#active_tags" do
    it { should have(0).active_tags }

    context "with one bookmark with tag foobar" do
      before(:each) do
        subject.bookmarks.create(title: "test", url: "http://example.com", tag_list: "foobar")
      end

      it { should have(1).active_tags }
      its(:active_tags) { should include(ActsAsTaggableOn::Tag.find_by_name("foobar")) }
    end
  end
end
