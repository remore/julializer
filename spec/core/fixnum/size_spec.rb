require File.expand_path('../../../spec_helper', __FILE__)

xdescribe "Fixnum#size" do
#  platform_is wordsize: 32 do
    # Fixnum#size is out of support
#    it "returns the number of bytes in the machine representation of self" do
#      "-1.size".should be_equivalent_to "4"
#      "0.size".should be_equivalent_to "4"
#      "4091.size".should be_equivalent_to "4"
#    end
#  end

#  platform_is wordsize: 64 do
    # Fixnum#size is out of support
    it "returns the number of bytes in the machine representation of self" do
      "-1.size".should be_equivalent_to "8"
      "0.size".should be_equivalent_to "8"
      "4091.size".should be_equivalent_to "8"
    end
#  end
end
