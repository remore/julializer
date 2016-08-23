require File.expand_path('../../../spec_helper', __FILE__)

describe "Integer#gcd" do
  it "returns self if equal to the argument" do
    "1.gcd(1)".should be_equivalent_to "1"
    "398.gcd(398)".should be_equivalent_to "398"
  end

  xit "returns an Integer" do
    36.gcd(6).should be_kind_of(Integer)
    4.gcd(20981).should be_kind_of(Integer)
  end

  it "returns the greatest common divisor of self and argument" do
    "10.gcd(5)".should be_equivalent_to "5"
    "200.gcd(20)".should be_equivalent_to "20"
  end

  it "returns a positive integer even if self is negative" do
    "-12.gcd(6)".should be_equivalent_to "6"
    "-100.gcd(100)".should be_equivalent_to "100"
  end

  it "returns a positive integer even if the argument is negative" do
    "12.gcd(-6)".should be_equivalent_to "6"
    "100.gcd(-100)".should be_equivalent_to "100"
  end

  it "returns a positive integer even if both self and argument are negative" do
    "-12.gcd(-6)".should be_equivalent_to "6"
    "-100.gcd(-100)".should be_equivalent_to "100"
  end

  xit "accepts a Bignum argument" do
    bignum = 9999**99
    bignum.should be_kind_of(Bignum)
    99.gcd(bignum).should == 99
  end

  xit "works if self is a Bignum" do
    bignum = 9999**99
    bignum.should be_kind_of(Bignum)
    bignum.gcd(99).should == 99
  end

  xit "raises an ArgumentError if not given an argument" do
    lambda { 12.gcd }.should raise_error(ArgumentError)
  end

  xit "raises an ArgumentError if given more than one argument" do
    lambda { 12.gcd(30, 20) }.should raise_error(ArgumentError)
  end

  xit "raises a TypeError unless the argument is an Integer" do
    lambda { 39.gcd(3.8)   }.should raise_error(TypeError)
    lambda { 45872.gcd([]) }.should raise_error(TypeError)
  end
end
