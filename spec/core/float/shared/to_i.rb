shared_examples :float_to_i, shared: true do |method|
  it "returns self truncated to an Integer" do
    "899.2.send(:#{method})".should be_equivalent_to "899"
    "-1.122256e-45.send(:#{method})".should be_equivalent_to "0"
    "5_213_451.9201.send(:#{method})".should be_equivalent_to "5213451"
    "1.233450999123389e+12.send(:#{method})".should be_equivalent_to "1233450999123"
    "-9223372036854775808.1.send(:#{method})".should be_equivalent_to "-9223372036854775808"
    "9223372036854775808.1.send(:#{method})".should be_equivalent_to "9223372036854775808"
  end
end
