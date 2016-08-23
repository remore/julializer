require File.expand_path('../../../spec_helper', __FILE__)

describe "Fixnum#**" do
  it "returns self raised to the given power" do
    "(2 ** 0)".should be_equivalent_to "1"
    "(2 ** 1)".should be_equivalent_to "2"
    "(2 ** 2)".should be_equivalent_to "4"

    "(9 ** 0.5)".should be_equivalent_to "3.0"
    #"(5 ** -1).to_f.to_s".should be_equivalent_to "== '0.2'"
    "(5.to_f ** -1).to_s".should be_equivalent_to "== '0.2'"

    "(2 ** 40)".should be_equivalent_to "1099511627776"
  end

  it "overflows the answer to a bignum transparantly" do
    "(2 ** 29)".should be_equivalent_to "536870912"
    "(2 ** 30)".should be_equivalent_to "1073741824"
    "(2 ** 31)".should be_equivalent_to "2147483648"
    "(2 ** 32)".should be_equivalent_to "4294967296"

    "(2 ** 61)".should be_equivalent_to "2305843009213693952"
    "(2 ** 62)".should be_equivalent_to "4611686018427387904"
    #"(2 ** 63)".should be_equivalent_to "9223372036854775808" #BigNum is not supported
    #"(2 ** 64)".should be_equivalent_to "18446744073709551616" #BigNum is not supported
    #"(8 ** 23)".should be_equivalent_to "590295810358705651712" #BigNum is not supported
  end

  it "raises negative numbers to the given power" do
    "((-2) ** 29)".should be_equivalent_to "-536870912"
    "((-2) ** 30)".should be_equivalent_to "1073741824"
    "((-2) ** 31)".should be_equivalent_to "-2147483648"
    "((-2) ** 32)".should be_equivalent_to "4294967296"

    "((-2) ** 61)".should be_equivalent_to "-2305843009213693952"
    "((-2) ** 62)".should be_equivalent_to "4611686018427387904"
    #"((-2) ** 63)".should be_equivalent_to "-9223372036854775808"  #BigNum is not supported
    #"((-2) ** 64)".should be_equivalent_to "18446744073709551616"  #BigNum is not supported
  end

  xit "can raise 1 to a Bignum safely" do
    big = bignum_value(4611686018427387904)
    (1 ** big).should eql 1
  end

  xit "can raise -1 to a Bignum safely" do
    ((-1) ** bignum_value(0)).should eql(1)
    ((-1) ** bignum_value(1)).should eql(-1)
  end

  xit "switches to a Float when the number is too big" do
    big = bignum_value(4611686018427387904)
    flt = (2 ** big)
    flt.should be_kind_of(Float)
    flt.infinite?.should == 1
  end

#  conflicts_with :Rational do
#    it "raises a ZeroDivisionError for 0**-1" do
#      lambda { (0**-1) }.should raise_error(ZeroDivisionError)
#    end
#
#    xit "raises a TypeError when given a non-Integer" do
#      lambda {
#        (obj = mock('10')).should_receive(:to_int).any_number_of_times.and_return(10)
#        13 ** obj
#      }.should raise_error(TypeError)
#      lambda { 13 ** "10"    }.should raise_error(TypeError)
#      lambda { 13 ** :symbol }.should raise_error(TypeError)
#    end
#  end

  xit "returns a complex number when negative and raised to a fractional power" do
    ((-8) ** (1.0/3))      .should be_close(Complex(1, 1.73205), TOLERANCE)
    ((-8) ** Rational(1,3)).should be_close(Complex(1, 1.73205), TOLERANCE)
  end
end
