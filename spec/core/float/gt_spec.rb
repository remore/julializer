require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#>" do
  it "returns true if self is greater than other" do
    "(1.5 > 1)".should be_equivalent_to "true"
    "(2.5 > 3)".should be_equivalent_to "false"
    #"(45.91 > bignum_value)".should be_equivalent_to "false"
  end

  xit "raises an ArgumentError when given a non-Numeric" do
    lambda { 5.0 > "4"       }.should raise_error(ArgumentError)
    lambda { 5.0 > mock('x') }.should raise_error(ArgumentError)
  end
end
