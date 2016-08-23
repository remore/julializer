require File.expand_path('../../../spec_helper', __FILE__)

describe "Integer#even?" do
  it "returns true for a Fixnum when it is an even number" do
    "(-2).even?".should be_equivalent_to "true"
    "(-1).even?".should be_equivalent_to "false"

    "0.even?".should be_equivalent_to "true"
    "1.even?".should be_equivalent_to "false"
    "2.even?".should be_equivalent_to "true"
  end

  xit "returns true for a Bignum when it is an even number" do
    bignum_value(0).even?.should be_true
    bignum_value(1).even?.should be_false

    (-bignum_value(0)).even?.should be_true
    (-bignum_value(1)).even?.should be_false
  end
end
