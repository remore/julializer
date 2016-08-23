shared_examples :fixnum_abs, shared: true do |method|
  it "returns self's absolute value" do
    { 0 => [0, -0, +0], 2 => [2, -2, +2], 100 => [100, -100, +100] }.each do |key, values|
      values.each do |value|
        "#{value}.send(:#{method})".should be_equivalent_to key
      end
    end
  end
end
