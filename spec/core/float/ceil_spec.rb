require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#ceil" do
  it "returns the smallest Integer greater than or equal to self" do
    "-1.2.ceil".should be_equivalent_to "( -1)"
    "-1.0.ceil".should be_equivalent_to "( -1)"
    "0.0.ceil".should be_equivalent_to "( 0 )"
    "1.3.ceil".should be_equivalent_to "( 2 )"
    "3.0.ceil".should be_equivalent_to "( 3 )"
    #"-9223372036854775808.1.ceil".should be_equivalent_to "(-9223372036854775808)"
    #"+9223372036854775808.1.ceil".should be_equivalent_to "(+9223372036854775808)"
  end
end
