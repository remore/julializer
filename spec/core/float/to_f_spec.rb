require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#to_f" do
  it "returns self" do
    "-500.3.to_f".should be_equivalent_to "-500.3"
    "267.51.to_f".should be_equivalent_to "267.51"
    "1.1412.to_f".should be_equivalent_to "1.1412"
  end
end
