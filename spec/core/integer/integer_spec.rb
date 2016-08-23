require File.expand_path('../../../spec_helper', __FILE__)

describe "Integer" do
  xit "includes Comparable" do
    Integer.include?(Comparable).should == true
  end
end

describe "Integer#integer?" do
  it "returns true for Integers" do
    "0.integer?".should be_equivalent_to "true"
    "-1.integer?".should be_equivalent_to "true"
    #bignum_value.integer?.should == true
  end
end
