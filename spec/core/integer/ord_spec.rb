require File.expand_path('../../../spec_helper', __FILE__)

describe "Integer#ord" do
  it "returns self" do
    "20.ord".should be_equivalent_to "(20)"
    "40.ord".should be_equivalent_to "(40)"

    "0.ord".should be_equivalent_to "(0)"
    "(-10).ord".should be_equivalent_to "(-10)"

    "?a.ord".should be_equivalent_to "(97)"
    "?Z.ord".should be_equivalent_to "(90)"

    #bignum_value.ord.should eql(bignum_value)
    #(-bignum_value).ord.should eql(-bignum_value)
  end
end
