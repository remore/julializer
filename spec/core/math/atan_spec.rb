require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

# arctangent : (-Inf, Inf) --> (-PI/2, PI/2)
describe "Math.atan" do
  xit "returns a float" do
    Math.atan(1).should be_kind_of(Float)
  end

  it "returns the arctangent of the argument" do
    "Math.atan(1)".should be_equivalent_to "Math::PI/4"
    "Math.atan(0)".should be_equivalent_to "0.0"
    "Math.atan(-1)".should be_equivalent_to "-Math::PI/4"
    "Math.atan(0.25)".should be_equivalent_to "0.244978663126864"
    "Math.atan(0.50)".should be_equivalent_to "0.463647609000806"
    "Math.atan(0.75)".should be_equivalent_to "0.643501108793284"
  end

  xit "raises a TypeError if the argument cannot be coerced with Float()" do
    lambda { Math.atan("test") }.should raise_error(TypeError)
  end

  it "returns NaN given NaN" do
    "Math.atan(Float::NAN).nan?".should be_equivalent_to "true"
  end

  xit "raises a TypeError if the argument is nil" do
    lambda { Math.atan(nil) }.should raise_error(TypeError)
  end

  xit "accepts any argument that can be coerced with Float()" do
    Math.atan(MathSpecs::Float.new).should be_close(0.785398163397448, TOLERANCE)
  end
end

xdescribe "Math#atan" do
  it "is accessible as a private instance method" do
    IncludesMath.new.send(:atan, 3.1415).should be_close(1.2626187313511, TOLERANCE)
  end
end
