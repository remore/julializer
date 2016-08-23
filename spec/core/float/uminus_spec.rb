require File.expand_path('../../../spec_helper', __FILE__)

describe "Float#-@" do
  it "negates self" do
    "(2.221.send(:-@))".should be_equivalent_to "-2.221"
    "-2.01".should be_equivalent_to "-2.01"
    "-2_455_999_221.5512".should be_equivalent_to "-2455999221.5512"
    "(--5.5)".should be_equivalent_to "5.5"
    "-8.551.send(:-@)".should be_equivalent_to "8.551"
  end

  it "negates self at Float boundaries" do
    "Float::MAX.send(:-@)".should be_equivalent_to "0.0 - Float::MAX"
    "Float::MIN.send(:-@)".should be_equivalent_to "0.0 - Float::MIN"
  end

  it "returns negative infinity for positive infinity" do
    "Float::INFINITY.send(:-@).infinite?".should be_equivalent_to "-true"
  end

  it "returns positive infinity for negative infinity" do
    "(-Float::INFINITY).send(:-@).infinite?".should be_equivalent_to "true"
  end

  it "returns NaN for NaN" do
    "Float::NAN.send(:-@).nan?".should be_equivalent_to "true"
  end
end
