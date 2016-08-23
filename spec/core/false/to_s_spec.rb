require File.expand_path('../../../spec_helper', __FILE__)

describe "FalseClass#to_s" do
  it "returns the string 'false'" do
    "false.to_s".should be_equivalent_to "false"
  end
end
