require File.expand_path('../../../spec_helper', __FILE__)

describe "Fixnum#-@" do
  it "returns self as a negative value" do
    #"2.send(:-@)".should be_equivalent_to -2
    "-2".should be_equivalent_to -2
    "-268435455".should be_equivalent_to -268435455
    "(--5)".should be_equivalent_to 5
    #"-8.send(:-@)".should be_equivalent_to 8
  end

  xit "negates self at Fixnum/Bignum boundaries" do
    fixnum_max.send(:-@).should == (0 - fixnum_max)
    fixnum_min.send(:-@).should == (0 - fixnum_min)
  end
end
