require File.expand_path('../../../spec_helper', __FILE__)

describe "FalseClass#&" do
  it "returns false" do
    "false & false".should be_equivalent_to "false"
    "false & true".should be_equivalent_to "false"
    #(false & nil).should == false # nil is out of support
    #"false & \"\"".should be_equivalent_to "false" # implicit type conversion is not supported in Julia
    #(false & mock('x')).should == false # mspec is not used
  end
end
