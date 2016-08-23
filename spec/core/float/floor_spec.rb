require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#floor" do
  it "returns the largest Integer less than or equal to self" do
    "-1.2.floor".should be_equivalent_to "-2"
    "-1.0.floor".should be_equivalent_to "-1"
    "0.0.floor".should be_equivalent_to "0"
    "1.0.floor".should be_equivalent_to "1"
    "5.9.floor".should be_equivalent_to "5"
    # bignum is not supported
    #"-9223372036854775808.1.floor".should be_equivalent_to "-9223372036854775808"
    #"+9223372036854775808.1.floor".should be_equivalent_to "+9223372036854775808"
  end
end
