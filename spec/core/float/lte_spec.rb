require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#<=" do
  it "returns true if self is less than or equal to other" do
    "(2.0 <= 3.14159)".should be_equivalent_to "true"
    "(-2.7183 <= -24)".should be_equivalent_to "false"
    "(0.0 <= 0.0)".should be_equivalent_to "true"
    #"(9_235.9 <= bignum_value)".should be_equivalent_to "true"
  end

  xit "raises an ArgumentError when given a non-Numeric" do
    lambda { 5.0 <= "4"       }.should raise_error(ArgumentError)
    lambda { 5.0 <= mock('x') }.should raise_error(ArgumentError)
  end
end
