require File.expand_path('../../../spec_helper', __FILE__)

describe "Fixnum#zero?" do
  it "returns true if self is 0" do
    "0.zero?".should be_equivalent_to "true"
    "-1.zero?".should be_equivalent_to "false"
    "1.zero?".should be_equivalent_to "false"
  end
end
