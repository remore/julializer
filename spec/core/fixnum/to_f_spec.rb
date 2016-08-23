require File.expand_path('../../../spec_helper', __FILE__)

describe "Fixnum#to_f" do
  it "returns self converted to a Float" do
    "0.to_f".should be_equivalent_to "0.0"
    "-500.to_f".should be_equivalent_to "-500.0"
    "9_641_278.to_f".should be_equivalent_to "9641278.0"
  end
end
