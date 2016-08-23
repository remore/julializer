require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#zero?" do
  it "returns true if self is 0.0" do
    "0.0.zero?".should be_equivalent_to "true"
    "1.0.zero?".should be_equivalent_to "false"
    "-1.0.zero?".should be_equivalent_to "false"
  end
end
