require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#round" do
  it "returns the nearest Integer" do
    "5.5.round".should be_equivalent_to "6"
    "0.4.round".should be_equivalent_to "0"
    "0.6.round".should be_equivalent_to "1"
    "-1.4.round".should be_equivalent_to "-1"
    "-2.8.round".should be_equivalent_to "-3"
    "0.0.round".should be_equivalent_to "0"
    "0.49999999999999994.round".should be_equivalent_to "0" # see http://jira.codehaus.org/browse/JRUBY-5048"
    "-0.49999999999999994.round".should be_equivalent_to "0"
  end

  xit "raises FloatDomainError for exceptional values" do
    lambda { (+infinity_value).round }.should raise_error(FloatDomainError)
    lambda { (-infinity_value).round }.should raise_error(FloatDomainError)
    lambda { nan_value.round }.should raise_error(FloatDomainError)
  end

  it "rounds self to an optionally given precision" do
    "5.5.round(0)".should be_equivalent_to "6"
    "5.7.round(1)".should be_equivalent_to "5.7"
    "1.2345678.round(2)".should be_equivalent_to "1.23"
    "123456.78.round(-2)".should be_equivalent_to "123500" # rounded up
    "-123456.78.round(-2)".should be_equivalent_to "-123500"
    "12.345678.round(3.999)".should be_equivalent_to "12.346"
  end

  it "returns zero when passed a negative argument with magitude greater the magitude of the whole number portion of the Float" do
    "0.8346268.round(-1)".should be_equivalent_to "0"
  end

  xit "raises a TypeError when its argument can not be converted to an Integer" do
    lambda { 1.0.round("4") }.should raise_error(TypeError)
    lambda { 1.0.round(nil) }.should raise_error(TypeError)
  end

  xit "raises FloatDomainError for exceptional values when passed a non-positive precision" do
    lambda { Float::INFINITY.round( 0) }.should raise_error(FloatDomainError)
    lambda { Float::INFINITY.round(-2) }.should raise_error(FloatDomainError)
    lambda { (-Float::INFINITY).round( 0) }.should raise_error(FloatDomainError)
    lambda { (-Float::INFINITY).round(-2) }.should raise_error(FloatDomainError)
  end

  xit "raises RangeError for NAN when passed a non-positive precision" do
    lambda { Float::NAN.round(0) }.should raise_error(RangeError)
    lambda { Float::NAN.round(-2) }.should raise_error(RangeError)
  end

  it "returns self for exceptional values when passed a non-negative precision" do
    "Float::INFINITY.round(2)".should be_equivalent_to "Float::INFINITY"
    "(-Float::INFINITY).round(2)".should be_equivalent_to "-Float::INFINITY"
    "Float::NAN.round(2)".should be_equivalent_to "Float::NAN"
  end

  # redmine:5227
  it "works for corner cases" do
    "42.0.round(308)".should be_equivalent_to "42.0"
    "1.0e307.round(2)".should be_equivalent_to "1.0e307"
  end

  # redmine:5271
  it "returns rounded values for big argument" do
    "0.42.round(2.0**30)".should be_equivalent_to "0.42"
  end

  # redmine #5272
  xit "returns rounded values for big values" do
    +2.5e20.round(-20).should   eql( +3 * 10 ** 20  )
    +2.4e20.round(-20).should   eql( +2 * 10 ** 20  )
    -2.5e20.round(-20).should   eql( -3 * 10 ** 20  )
    -2.4e20.round(-20).should   eql( -2 * 10 ** 20  )
    +2.5e200.round(-200).should eql( +3 * 10 ** 200 )
    +2.4e200.round(-200).should eql( +2 * 10 ** 200 )
    -2.5e200.round(-200).should eql( -3 * 10 ** 200 )
    -2.4e200.round(-200).should eql( -2 * 10 ** 200 )
  end
end
