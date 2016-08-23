require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#divmod" do
  it "returns an [quotient, modulus] from dividing self by other" do
    "3.14.divmod(2)[0]".should be_equivalent_to "1"
    "3.14.divmod(2)[1]".should be_equivalent_to "1.14"
    "2.8284.divmod(3.1415)[0]".should be_equivalent_to "0"
    "2.8284.divmod(3.1415)[1]".should be_equivalent_to "2.8284"
    #values = -1.0.divmod(bignum_value)
    #values[0].should eql(-1)
    #values[1].should be_close(9223372036854775808.000, TOLERANCE)
    "-1.0.divmod(1)[0]".should be_equivalent_to "-1"
    "-1.0.divmod(1)[1]".should be_equivalent_to "0.0"
  end

  # Behaviour established as correct in r23953
  xit "raises a FloatDomainError if self is NaN" do
    lambda { nan_value.divmod(1) }.should raise_error(FloatDomainError)
  end

  # Behaviour established as correct in r23953
  xit "raises a FloatDomainError if other is NaN" do
    lambda { 1.divmod(nan_value) }.should raise_error(FloatDomainError)
  end

  # Behaviour established as correct in r23953
  xit "raises a FloatDomainError if self is Infinity" do
    lambda { infinity_value.divmod(1) }.should raise_error(FloatDomainError)
  end

  xit "raises a ZeroDivisionError if other is zero" do
    lambda { 1.0.divmod(0)   }.should raise_error(ZeroDivisionError)
    lambda { 1.0.divmod(0.0) }.should raise_error(ZeroDivisionError)
  end

  # redmine #5276"
  it "returns the correct [quotient, modulus] even for large quotient" do
    "0.59.divmod(7.761021455128987e-11).first".should be_equivalent_to "7602092113"
  end
end
