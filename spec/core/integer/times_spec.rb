require File.expand_path('../../../spec_helper', __FILE__)

describe "Integer#times" do
  # Enumerator is out of support
  xit "returns self" do
    "5.times {}".should be_equivalent_to "5"
    "9.times {}".should be_equivalent_to "9"
    "9.times { |n| n - 2 }".should be_equivalent_to "9"
  end

  it "yields each value from 0 to self - 1" do
    [
      "a = []",
      "9.times { |i| a << i }",
      "-2.times { |i| a << i }",
      "a"
    ].should be_equivalent_to "[0, 1, 2, 3, 4, 5, 6, 7, 8]"
  end

  it "skips the current iteration when encountering 'next'" do
    [
      "a = []",
      "3.times do |i|",
      "next if i == 1",
      "a << i",
      "end",
      "a"
    ].should be_equivalent_to "[0, 2]"
  end

  it "skips all iterations when encountering 'break'" do
    [
      "a = []",
      "5.times do |i|",
      "break if i == 3",
      "a << i",
      "end",
      "a"
    ].should be_equivalent_to "[0, 1, 2]"
  end

  # enumrator is not supported as of now
  xit "skips all iterations when encountering break with an argument and returns that argument" do
    "9.times { break 2 }".should be_equivalent_to "2"
  end

  it "executes a nested while loop containing a break expression" do
    [
      "a = [false]",
      "b = 1.times do |i|",
      "while true",
        "a.shift or break",
      "end",
      "end",
      "a.size"
    ].should be_equivalent_to "0"
    # Enumrator is not supported
    #[
    #  "a = [false]",
    #  "b = 1.times do |i|",
    #  "while true",
    #    "a.shift or break",
    #  "end",
    #  "end",
    #  "b"
    #].should be_equivalent_to "1"
  end

  it "executes a nested #times" do
    [
      "a = 0",
      "b = 3.times do |i|",
      "2.times { a += 1 }",
      "end",
      "a"
    ].should be_equivalent_to "6"
    # Enumrator is not supported
    #[
    #  "a = 0",
    #  "b = 3.times do |i|",
    #  "2.times { a += 1 }",
    #  "end",
    #  "b"
    #].should be_equivalent_to "3"
  end

  # Enumerator is not supported
  xit "returns an Enumerator" do
    [
      "result = []",
      "enum = 3.times",
      "enum.each { |i| result << i }",
      "result"
    ].should be_equivalent_to "[0, 1, 2]"
  end

  # Enumerator is out of support
  xdescribe "when no block is given" do
    describe "returned Enumerator" do
      describe "size" do
        it "returns self" do
          "5.times.size".should be_equivalent_to "5"
          "10.times.size".should be_equivalent_to "10"
          "0.times.size".should be_equivalent_to "0"
        end
      end
    end
  end
end
