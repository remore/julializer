require File.expand_path('../../../spec_helper', __FILE__)

describe "Float constant" do
  xit "DIG is 15" do
    "Float::DIG".should be_equivalent_to "15"
  end

  it "EPSILON is 2.220446049250313e-16" do
    "Float::EPSILON".should be_equivalent_to "2.0 ** -52"
    "Float::EPSILON".should be_equivalent_to "2.220446049250313e-16"
  end

  xit "MANT_DIG is 53" do
    "Float::MANT_DIG".should be_equivalent_to "53"
  end

  xit "MAX_10_EXP is 308" do
    "Float::MAX_10_EXP".should be_equivalent_to "308"
  end

  xit "MIN_10_EXP is -308" do
    "Float::MIN_10_EXP".should be_equivalent_to "-307"
  end

  xit "MAX_EXP is 1024" do
    "Float::MAX_EXP".should be_equivalent_to "1024"
  end

  xit "MIN_EXP is -1021" do
    "Float::MIN_EXP".should be_equivalent_to "-1021"
  end

  it "MAX is 1.7976931348623157e+308" do
    # See https://en.wikipedia.org/wiki/Double-precision_floating-point_format#Double-precision_examples
    "Float::MAX".should be_equivalent_to "(1 + (1 - (2 ** -52))) * (2.0 ** 1023)"
    "Float::MAX".should be_equivalent_to "1.7976931348623157e+308"
  end

  it "MIN is 2.2250738585072014e-308" do
    "Float::MIN".should be_equivalent_to "(2.0 ** -1022)"
    "Float::MIN".should be_equivalent_to "2.2250738585072014e-308"
  end

  xit "RADIX is 2" do
    "Float::RADIX".should be_equivalent_to "2"
  end

  it "INFINITY is the positive infinity" do
    "Float::INFINITY.infinite?".should be_equivalent_to "true"
  end

  it "NAN is 'not a number'" do
    "Float::NAN.nan?".should be_equivalent_to "true"
  end
end
