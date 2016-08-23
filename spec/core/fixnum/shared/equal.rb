shared_examples :fixnum_equal, shared: true do |method|
  it "returns true if self has the same value as other" do
    #"#{value}.send(:#{method})".should be_equivalent_to key
    "1.send(:#{method}, 1)".should be_equivalent_to "true"
    "9.send(:#{method}, 5)".should be_equivalent_to "false"

    # Actually, these call Float#==, Bignum#== etc.
    "9.send(:#{method}, 9.0)".should be_equivalent_to "true"
    "9.send(:#{method}, 9.01)".should be_equivalent_to "false"

    #"10.send(:#{method}, bignum_value)".should be_equivalent_to "false"
  end

  xit "calls 'other == self' if the given argument is not a Fixnum" do
    "1.send(#{method}, '*')".should be_equivalent_to "false"

    obj = mock('one other')
    obj.should_receive(:==).any_number_of_times.and_return(false)
    "1.send(#{method}, obj)".should be_equivalent_to "false"

    obj = mock('another')
    obj.should_receive(:==).any_number_of_times.and_return(true)
    "2.send(#{method}, obj)".should be_equivalent_to "true"
  end
end
