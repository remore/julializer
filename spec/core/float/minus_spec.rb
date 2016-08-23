require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#-" do
  it "returns self minus other" do
    "(9_237_212.5280 - 5_280)".should be_equivalent_to "9231932.528"
    #"(2_560_496.1691 - bignum_value)".should be_equivalent_to "-9223372036852215808.000"
    "(5.5 - 5.5)".should be_equivalent_to "0.0"
  end
end
