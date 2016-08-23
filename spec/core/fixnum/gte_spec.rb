require File.expand_path('../../../spec_helper', __FILE__)

describe "Fixnum#>=" do
  it "returns true if self is greater than or equal to the given argument" do
    "(13 >= 2)".should be_equivalent_to "true"
    "(-500 >= -600)".should be_equivalent_to "true"

    "(1 >= 5)".should be_equivalent_to "false"
    "(2 >= 2)".should be_equivalent_to "true"
    "(5 >= 5)".should be_equivalent_to "true"

    #(900 >= bignum_value).should == false
    "(5 >= 4.999)".should be_equivalent_to "true"
  end

  xit "raises an ArgumentError when given a non-Integer" do
    lambda { 5 >= "4"       }.should raise_error(ArgumentError)
    lambda { 5 >= mock('x') }.should raise_error(ArgumentError)
  end
end
