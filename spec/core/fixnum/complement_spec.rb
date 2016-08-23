require File.expand_path('../../../spec_helper', __FILE__)

describe "Fixnum#~" do
  it "returns self with each bit flipped" do
    "~0".should be_equivalent_to "-1"
    "~1221".should be_equivalent_to "-1222"
    "~-2".should be_equivalent_to "1"
    "~-599".should be_equivalent_to "598"
  end
end
