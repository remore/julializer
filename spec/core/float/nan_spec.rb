require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#nan?" do
  it "returns true if self is not a valid IEEE floating-point number" do
    "0.0.nan?".should be_equivalent_to "false"
    "-1.5.nan?".should be_equivalent_to "false"
    "Float::NAN.nan?".should be_equivalent_to "true"
  end
end
