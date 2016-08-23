require File.expand_path('../../../spec_helper', __FILE__)

describe "Fixnum#/" do
  it "returns self divided by the given argument" do
    "(2 / 2)".should be_equivalent_to "1"
    "(3 / 2)".should be_equivalent_to "1"
  end

  it "supports dividing negative numbers" do
    "(-1 / 10)".should be_equivalent_to "-1"
  end

  xit "raises a ZeroDivisionError if the given argument is zero and not a Float" do
    lambda { 1 / 0 }.should raise_error(ZeroDivisionError)
  end

  xit "does NOT raise ZeroDivisionError if the given argument is zero and is a Float" do
    "(1 / 0.0).to_s".should be_equivalent_to "Infinity"
    "(-1 / 0.0).to_s".should be_equivalent_to "-Infinity"
  end

  it "coerces fixnum and return self divided by other" do
    "(-1 / 50.4)".should be_equivalent_to "-0.0198412698412698"
    #"(1 / bignum_value)".should be_equivalent_to "0" #bignum is not supported
  end

  xit "raises a TypeError when given a non-Integer" do
    lambda {
      (obj = mock('10')).should_receive(:to_int).any_number_of_times.and_return(10)
      13 / obj
    }.should raise_error(TypeError)
    lambda { 13 / "10"    }.should raise_error(TypeError)
    lambda { 13 / :symbol }.should raise_error(TypeError)
  end
end
