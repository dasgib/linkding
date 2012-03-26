require 'spec_helper'

describe Bookmark do
  describe ".search" do
    before(:all) do
      Bookmark.delete_all
      User.delete_all
      Factory.create(:bookmark, title: "foobar")
      Factory.create(:bookmark, title: "Something else")
    end

    it "should find 1 for foobar" do
      Bookmark.search("foobar").count.should == 1
    end
  end
end
