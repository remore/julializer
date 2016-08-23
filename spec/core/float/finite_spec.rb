require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#finite?" do
  it "returns true for finite values" do
    "3.14159.finite?".should be_equivalent_to "true"
  end

  it "returns false for positive infinity" do
    "Float::INFINITY.finite?".should be_equivalent_to "false"
  end

  it "returns false for negative infinity" do
    "(-Float::INFINITY).finite?".should be_equivalent_to "false"
  end

  it "returns false for NaN" do
    "Float::NAN.finite?".should be_equivalent_to "false"
  end
end
