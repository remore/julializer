require File.expand_path('../../../spec_helper', __FILE__)

#ruby_version_is "2.2" do
  describe "Float#prev_float" do
    xit "returns a float the smallest possible step smaller than the receiver" do
      barely_negative = 0.0.prev_float
      barely_negative.should == 0.0.prev_float

      barely_negative.should < 0.0
      barely_negative.should > barely_negative.prev_float

      midpoint = barely_negative / 2
      [0.0, barely_negative].should include midpoint
    end

    it "steps directly between MAX and INFINITY" do
      "Float::INFINITY.prev_float".should be_equivalent_to "Float::MAX"
      "(-Float::MAX).prev_float".should be_equivalent_to "-Float::INFINITY"
    end

    it "steps directly between 1.0 and 1.0 - EPSILON/2" do
      "1.0.prev_float".should be_equivalent_to "1.0 - Float::EPSILON/2"
    end

    it "steps directly between -1.0 and -1.0 - EPSILON" do
      "(-1.0).prev_float".should be_equivalent_to "-1.0 - Float::EPSILON"
    end

    xit "reverses the effect of next_float" do
      num = rand
      num.next_float.prev_float.should == num
    end

    xit "returns positive zero when stepping downward from just above zero" do
      x = 0.0.next_float.prev_float
      (1/x).should == Float::INFINITY
      x = (-0.0).next_float.prev_float
      (1/x).should == Float::INFINITY
      x.prev_float.should < 0
    end

    it "returns NAN if NAN was the receiver" do
      "Float::NAN.prev_float.nan?".should be_equivalent_to "true"
    end
  end
#end
