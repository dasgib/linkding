require 'spec_helper'

describe Bookmark do
  describe ".search" do
    before(:all) do
      Bookmark.delete_all
      User.delete_all
      Factory.create(:bookmark, title: "foobar")
      Factory.create(:bookmark, title: "Something else", description: "learning")
      Factory.create(:bookmark, title: "Test", url: "http://example.com", description: "test", tag_list: "learns, mytag")
    end

    it "should find 1 for foobar" do
      Bookmark.search("foobar").should have(1).item
    end

    it "should find words in tags" do
      Bookmark.search("mytag").should have(1).item
    end

    it "should use english stemming" do
      Bookmark.search("learning").should have(2).items
    end
  end

  describe "#copy_as_new" do
    before(:each) { @original = Bookmark.find_by_title("Test") }

    subject { @original.copy_as_new }

    it "should copy url, title, description and tag_list" do
      subject.title.should == @original.title
      subject.description.should == @original.description
      subject.url.should == @original.url
      subject.tag_list.should == @original.tag_list
    end

    it { should be_new_record }
    it { should_not be_persisted }

    it "should not copy the owner" do
      subject.user.should be_nil
    end
  end
end
