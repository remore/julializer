require File.expand_path('../../../spec_helper', __FILE__)

describe "Fixnum#hash" do
  xit "is provided" do # No OOP Concept
    1.respond_to?(:hash).should == true
  end

  it "is stable" do
    "1.hash".should be_equivalent_to "hash(1)"
  end
end
