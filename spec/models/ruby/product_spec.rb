require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "Product" do
  include_examples "SpecHelper"

  before(:each) do
    setup_test_for Product,'testuser'
  end

  it "should process Product query" do
    pending
  end

  it "should process Product create" do
    pending
  end

  it "should process Product update" do
    pending
  end

  it "should process Product delete" do
    pending
  end
end