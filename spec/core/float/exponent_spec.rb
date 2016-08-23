require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#**" do
  it "returns self raise to the other power" do
    "(2.3 ** 3)".should be_equivalent_to "12.167"
    "(5.2 ** -1)".should be_equivalent_to "0.192307692307692"
    "(9.5 ** 0.5)".should be_equivalent_to "3.08220700148449"
    #"(9.5 ** 0xffffffff).to_s".should be_equivalent_to 'Infinity'
  end

  xit "returns a complex number when negative and raised to a fractional power" do
    ((-8.0) ** (1.0/3))      .should be_close(Complex(1, 1.73205), TOLERANCE)
    ((-8.0) ** Rational(1,3)).should be_close(Complex(1, 1.73205), TOLERANCE)
  end
end
