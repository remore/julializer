require File.expand_path('../../../spec_helper', __FILE__)

describe "Fixnum#*" do
  it "returns self multiplied by the given Integer" do
    "(4923 * 2)".should be_equivalent_to "9846"
    "(1342177 * 800)".should be_equivalent_to "1073741600"
    "(65536 * 65536)".should be_equivalent_to "4294967296"

    #(256 * bignum_value).should == 2361183241434822606848
    "(6712 * 0.25)".should be_equivalent_to "1678.0"
  end

  xit "raises a TypeError when given a non-Integer" do
    lambda {
      (obj = mock('10')).should_receive(:to_int).any_number_of_times.and_return(10)
      13 * obj
    }.should raise_error(TypeError)
    lambda { 13 * "10"    }.should raise_error(TypeError)
    lambda { 13 * :symbol }.should raise_error(TypeError)
  end

  xit "overflows to Bignum when the result does not fit in Fixnum" do
    (fixnum_max * fixnum_max).should be_kind_of(Bignum)
    (fixnum_max * fixnum_min).should be_kind_of(Bignum)
  end

end
