require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../shared/to_i', __FILE__)

describe "Integer#round" do
  it_behaves_like(:integer_to_i, :round)

  it "rounds itself as a float if passed a positive precision" do
    #[2, -4, 10**70, -10**100].each do |v|
    #  v.round(42).should eql(v.to_f)
    #end
    "2.round(42)".should be_equivalent_to "(2.to_f)"
    "-4.round(42)".should be_equivalent_to "(-4.to_f)"
    "10**70.round(42)".should be_equivalent_to "(10**70.to_f)"
    "-10**100.round(42)".should be_equivalent_to "(-10**100.to_f)"
  end

  it "returns itself if passed zero" do
    #[2, -4, 10**70, -10**100].each do |v|
    #  v.round(0).should eql(v)
    #end
    "2.round(0)".should be_equivalent_to "(2)"
    "-4.round(0)".should be_equivalent_to "(-4)"
    "10**70.round(0)".should be_equivalent_to "(10**70)"
    "-10**100.round(0)".should be_equivalent_to "(-10**100)"
  end

  # redmine:5228
  it "returns itself rounded if passed a negative value" do
    +249.round(-2).should eql(+200)
    +250.round(-2).should eql(+300)
    -249.round(-2).should eql(-200)
    -250.round(-2).should eql(-300)
    (+25 * 10**70).round(-71).should eql(+30 * 10**70)
    (-25 * 10**70).round(-71).should eql(-30 * 10**70)
    (+25 * 10**70 - 1).round(-71).should eql(+20 * 10**70)
    (-25 * 10**70 + 1).round(-71).should eql(-20 * 10**70)
  end

#  platform_is_not wordsize: 32 do
#    it "raises a RangeError when passed a big negative value" do
#      lambda { 42.round(fixnum_min) }.should raise_error(RangeError)
#    end
#  end

  xit "raises a RangeError when passed Float::INFINITY" do
    lambda { 42.round(Float::INFINITY) }.should raise_error(RangeError)
  end

  xit "raises a RangeError when passed a beyond signed int" do
    lambda { 42.round(1<<31) }.should raise_error(RangeError)
  end

  xit "raises a TypeError when passed a String" do
    lambda { 42.round("4") }.should raise_error(TypeError)
  end

  xit "raises a TypeError when its argument cannot be converted to an Integer" do
    lambda { 42.round(nil) }.should raise_error(TypeError)
  end

  xit "calls #to_int on the argument to convert it to an Integer" do
    obj = mock("Object")
    obj.should_receive(:to_int).and_return(0)
    42.round(obj)
  end

  xit "raises a TypeError when #to_int does not return an Integer" do
    obj = mock("Object")
    obj.stub!(:to_int).and_return([])
    lambda { 42.round(obj) }.should raise_error(TypeError)
  end
end
