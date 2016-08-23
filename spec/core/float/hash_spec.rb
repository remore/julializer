require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#hash" do
  xit "is provided" do
    0.0.respond_to?(:hash).should == true
  end

  it "is stable" do
    "1.0.hash".should be_equivalent_to "hash(1.0)"
  end
end
