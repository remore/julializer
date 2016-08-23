require File.expand_path('../../../spec_helper', __FILE__)

#ruby_version_is "2.2" do
  describe "Float#next_float" do
    xit "returns a float the smallest possible step greater than the receiver" do
      barely_positive = 0.0.next_float
      barely_positive.should == 0.0.next_float

      barely_positive.should > 0.0
      barely_positive.should < barely_positive.next_float

      midpoint = barely_positive / 2
      [0.0, barely_positive].should include midpoint
    end

    it "steps directly between MAX and INFINITY" do
      "(-Float::INFINITY).next_float".should be_equivalent_to "-Float::MAX"
      "Float::MAX.next_float".should be_equivalent_to "Float::INFINITY"
    end

    it "steps directly between 1.0 and 1.0 + EPSILON" do
      "1.0.next_float".should be_equivalent_to "1.0 + Float::EPSILON"
    end

    it "steps directly between -1.0 and -1.0 + EPSILON/2" do
      "(-1.0).next_float".should be_equivalent_to "-1.0 + Float::EPSILON/2"
    end

    xit "reverses the effect of prev_float" do
      num = rand
      num.prev_float.next_float.should == num
    end

    xit "returns negative zero when stepping upward from just below zero" do
      x = 0.0.prev_float.next_float
      (1/x).should == -Float::INFINITY
      x = (-0.0).prev_float.next_float
      (1/x).should == -Float::INFINITY
      x.next_float.should > 0
    end

    it "returns NAN if NAN was the receiver" do
      "Float::NAN.next_float.nan?".should be_equivalent_to "true"
    end
  end
#end
