require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe "Math.atan2" do
  xit "returns a float" do
    Math.atan2(1.2, 0.5).should be_kind_of(Float)
  end

  it "returns the arc tangent of y, x" do
    "Math.atan2(4.2, 0.3)".should be_equivalent_to "1.49948886200961"
    "Math.atan2(0.0, 1.0)".should be_equivalent_to "0.0"
    "Math.atan2(-9.1, 3.2)".should be_equivalent_to "-1.23265379809025"
    "Math.atan2(7.22, -3.3)".should be_equivalent_to "1.99950888779256"
  end

  xit "raises a TypeError if the argument cannot be coerced with Float()" do
    lambda { Math.atan2(1.0, "test")    }.should raise_error(TypeError)
    lambda { Math.atan2("test", 0.0)    }.should raise_error(TypeError)
    lambda { Math.atan2("test", "this") }.should raise_error(TypeError)
  end

  xit "raises a TypeError if the argument is nil" do
    lambda { Math.atan2(nil, 1.0)  }.should raise_error(TypeError)
    lambda { Math.atan2(-1.0, nil) }.should raise_error(TypeError)
    lambda { Math.atan2(nil, nil)  }.should raise_error(TypeError)
  end

  xit "accepts any argument that can be coerced with Float()" do
    Math.atan2(MathSpecs::Float.new, MathSpecs::Float.new).should be_close(0.785398163397448, TOLERANCE)
  end

  xit "returns positive zero when passed 0.0, 0.0" do
    Math.atan2(0.0, 0.0).should be_positive_zero
  end

  xit "returns negative zero when passed -0.0, 0.0" do
    Math.atan2(-0.0, 0.0).should be_negative_zero
  end

  it "returns Pi when passed 0.0, -0.0" do
    "Math.atan2(0.0, -0.0)".should be_equivalent_to "Math::PI"
  end

  it "returns -Pi when passed -0.0, -0.0" do
    "Math.atan2(-0.0, -0.0)".should be_equivalent_to "-Math::PI"
  end

end

xdescribe "Math#atan2" do
  it "is accessible as a private instance method" do
    IncludesMath.new.send(:atan2, 1.1, 2.2).should be_close(0.463647609000806, TOLERANCE)
  end
end
