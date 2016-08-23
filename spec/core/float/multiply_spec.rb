require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#*" do
  it "returns self multiplied by other" do
    "(4923.98221 * 2)".should be_equivalent_to "9847.96442"
    "(6712.5 * 0.25)".should be_equivalent_to "1678.125"
    #(256.4096 * bignum_value).should be_close(2364961134621118431232.000, TOLERANCE)
  end

  xit "raises a TypeError when given a non-Numeric" do
    lambda { 13.0 * "10"    }.should raise_error(TypeError)
    lambda { 13.0 * :symbol }.should raise_error(TypeError)
  end
end
