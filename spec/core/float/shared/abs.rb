require File.expand_path('../../../../spec_helper', __FILE__)

shared_examples :float_abs, shared: true do |method|
  it "returns the absolute value" do
    "-99.1.send(:#{method})".should be_equivalent_to 99.1
    "4.5.send(:#{method})".should be_equivalent_to 4.5
    "0.0.send(:#{method})".should be_equivalent_to 0.0
  end

  it "returns 0.0 if -0.0" do
    "(-0.0).send(:#{method})".should be_equivalent_to 0
  end

  it "returns Infinity if -Infinity" do
    "(-Float::INFINITY).send(:#{method}).infinite?".should be_equivalent_to "true"
  end

  it "returns NaN if NaN" do
    "Float::NAN.send(:#{method}).nan?".should be_equivalent_to "true"
  end
end
