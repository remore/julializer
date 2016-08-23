shared_examples :float_modulo, shared: true do |method|
  it "returns self modulo other" do
    "6543.21.send(:#{method}, 137)".should be_equivalent_to "104.21"
    #5667.19.send(@method, bignum_value).should be_close(5667.19, TOLERANCE)
    "6543.21.send(:#{method}, 137.24)".should be_equivalent_to "92.9299999999996"

    "-1.0.send(:#{method}, 1)".should be_equivalent_to 0
  end

  it "returns self when modulus is +Infinity" do
    "4.2.send(:#{method}, Float::INFINITY)".should be_equivalent_to "4.2"
  end

  it "returns -Infinity when modulus is -Infinity" do
    "4.2.send(:#{method}, -Float::INFINITY)".should be_equivalent_to "-Float::INFINITY"
  end

  it "returns NaN when called on NaN or Infinities" do
    "Float::NAN.send(:#{method}, 42)".should be_equivalent_to "NaN"
    "Float::INFINITY.send(:#{method}, 42)".should be_equivalent_to "NaN"
    "(-Float::INFINITY).send(:#{method}, 42)".should be_equivalent_to "NaN"
  end

  it "returns NaN when modulus is NaN" do
    "4.2.send(:#{method}, Float::NAN)".should be_equivalent_to "NaN"
  end

  it "returns -0.0 when called on -0.0 with a non zero modulus" do
    "(-0.0).send(:#{method}, 42)".should be_equivalent_to "0"
    #(1/(-0.0).send(:#{method}, 42)).should < 0
    "(-0.0).send(:#{method}, Float::INFINITY)".should be_equivalent_to "0"
    #(1/(-0.0).send(:#{method}, Float::INFINITY)).should < 0
  end

  xit "raises a ZeroDivisionError if other is zero" do
    lambda { 1.0.send(@method, 0) }.should raise_error(ZeroDivisionError)
    lambda { 1.0.send(@method, 0.0) }.should raise_error(ZeroDivisionError)
  end
end
