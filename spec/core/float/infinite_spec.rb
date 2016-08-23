require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#infinite?" do
  it "returns nil for finite values" do
    "1.0.infinite?".should be_equivalent_to "false"
  end

  it "returns 1 for positive infinity" do
    "Float::INFINITY.infinite?".should be_equivalent_to "true"
  end

  it "returns -1 for negative infinity" do
    "(-Float::INFINITY).infinite?".should be_equivalent_to "true"
  end

  it "returns nil for NaN" do
    "Float::NAN.infinite?".should be_equivalent_to "false"
  end
end
