require File.expand_path('../../../spec_helper', __FILE__)

xdescribe "FalseClass#inspect" do
  it "returns the string 'false'" do
    "false.inspect".should be_equivalent_to "false"
  end
end
