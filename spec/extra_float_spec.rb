require File.expand_path('../spec_helper', __FILE__)

describe "Float#to_i" do
  it "returns the Float#to_i equivalent value" do
    "-1.6.to_i".should be_equivalent_to "-1"
    "-1.5.to_i".should be_equivalent_to "-1"
    "-1.4.to_i".should be_equivalent_to "-1"
    "0.to_i".should be_equivalent_to "0"
    "1.4.to_i".should be_equivalent_to "1"
    "1.5.to_i".should be_equivalent_to "1"
    "1.6.to_i".should be_equivalent_to "1"
  end
end
