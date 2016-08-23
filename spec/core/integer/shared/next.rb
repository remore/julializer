shared_examples :integer_next, shared: true do |method|
  it "returns the next larger positive Fixnum" do
    "2.send(:#{method})".should be_equivalent_to "3"
  end

  it "returns the next larger negative Fixnum" do
    "(-2).send(:#{method})".should be_equivalent_to "-1"
  end

  xit "returns the next larger positive Bignum" do
    bignum_value.send(@method).should == bignum_value(1)
  end

  xit "returns the next larger negative Bignum" do
    (-bignum_value(1)).send(@method).should == -bignum_value
  end

  xit "overflows a Fixnum to a Bignum" do
    fixnum_max.send(@method).should == fixnum_max + 1
  end

  xit "underflows a Bignum to a Fixnum" do
    (fixnum_min - 1).send(@method).should == fixnum_min
  end
end
