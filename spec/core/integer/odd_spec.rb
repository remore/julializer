require File.expand_path('../../../spec_helper', __FILE__)

describe "Integer#odd?" do
  it "returns true when self is an odd number" do
    "(-2).odd?".should be_equivalent_to "false"
    "(-1).odd?".should be_equivalent_to "true"

    "0.odd?".should be_equivalent_to "false"
    "1.odd?".should be_equivalent_to "true"
    "2.odd?".should be_equivalent_to "false"

    #bignum_value(0).odd?.should be_false
    #bignum_value(1).odd?.should be_true

    #(-bignum_value(0)).odd?.should be_false
    #(-bignum_value(1)).odd?.should be_true
  end
end
