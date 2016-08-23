require 'spec_helper'

#http://ruby-doc.org/core-2.3.1/Fixnum.html
describe "Fixnum" do
  #using ExtString
  example "#+" do
    "1+2".should be_converted_to("1+2")
    "1+2".should be_equivalent_to("1+2")
  end

  example "#-" do
    "-991+2".should be_converted_to("-991+2")
    "-991+2".should be_equivalent_to("-991+2")
  end

  example "#/" do
    "4/3".should be_converted_to("4/3")
    "4/3".should be_equivalent_to("4/3")
  end

  example "#to_i" do
    "12.to_i".should be_converted_to("convert(BigInt,12)")
    "12.to_i".should be_equivalent_to("convert(BigInt,12)")
  end
  
  example "#to_f" do
    "123.to_f".should be_converted_to("convert(Float64,123)")
    "123.to_f".should be_equivalent_to("convert(Float64,123)")
  end

  it "works with maximum value" do
    "4611686018427387903".should be_equivalent_to("4611686018427387903") 
  end

  it "works with minimum value" do
    "-4611686018427387904".should be_equivalent_to("-4611686018427387904") 
  end
end
