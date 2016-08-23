shared_examples :integer_to_i, shared: true do |method|
  it "returns self" do
    "10.send(:#{method})".should be_equivalent_to "10"
    "(-15).send(:#{method})".should be_equivalent_to "-15"
    #"bignum_value.send(:#{method})".should be_equivalent_to "bignum_value"
    #"(-bignum_value).send(:#{method})".should be_equivalent_to "-bignum_value"
  end
end
