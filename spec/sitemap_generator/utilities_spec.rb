require 'spec_helper'

describe SitemapGenerator::Utilities do

  describe "assert_valid_keys" do
    it "should raise error on invalid keys" do
      lambda {
        SitemapGenerator::Utilities.assert_valid_keys({ :name => "Rob", :years => "28" }, :name, :age)
      }.should raise_exception(ArgumentError)
      lambda {
        SitemapGenerator::Utilities.assert_valid_keys({ :name => "Rob", :age => "28" }, "name", "age")
      }.should raise_exception(ArgumentError)
    end

    it "should not raise error on valid keys" do
      lambda {
        SitemapGenerator::Utilities.assert_valid_keys({ :name => "Rob", :age => "28" }, :name, :age)
      }.should_not raise_exception

      lambda {
        SitemapGenerator::Utilities.assert_valid_keys({ :name => "Rob" }, :name, :age)
      }.should_not raise_exception
    end
  end
end