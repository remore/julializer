shared_examples :array_slice, shared: true do |method|
  it "returns the element at index with [index]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(1)".should be_equivalent_to "'b'"

    scenario = ["a = [1, 2, 3, 4]"]
    scenario.push("a.#{method.to_s}(0)").should be_equivalent_to "1"
    scenario.push("a.#{method.to_s}(1)").should be_equivalent_to "2"
    scenario.push("a.#{method.to_s}(2)").should be_equivalent_to "3"
    scenario.push("a.#{method.to_s}(3)").should be_equivalent_to "4"
    #a.send(@method, 4).should == nil
    #a.send(@method, 10).should == nil
    scenario.push("a").should be_equivalent_to "[1, 2, 3, 4]"
  end

  it "returns the element at index from the end of the array with [-index]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(-2)".should be_equivalent_to "'d'"

    scenario = ["a = [1, 2, 3, 4]"]
    scenario.push("a.#{method.to_s}(-1)").should be_equivalent_to "4"
    scenario.push("a.#{method.to_s}(-2)").should be_equivalent_to "3"
    scenario.push("a.#{method.to_s}(-3)").should be_equivalent_to "2"
    scenario.push("a.#{method.to_s}(-4)").should be_equivalent_to "1"
    #a.send(@method, -5).should == nil
    #a.send(@method, -10).should == nil
    scenario.push("a").should be_equivalent_to "[1, 2, 3, 4]"
  end

  it "returns count elements starting from index with [index, count]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(2,3)".should be_equivalent_to "['c','d','e']"

    scenario = ["a = [1, 2, 3, 4]"]
    scenario.push("a.#{method.to_s}(0,0)").should be_equivalent_to "[1]"
    scenario.push("a.#{method.to_s}(0,1)").should be_equivalent_to "[1,2]"
    scenario.push("a.#{method.to_s}(0,2)").should be_equivalent_to "[1,2,3,4]"
    scenario.push("a.#{method.to_s}(0,4)").should be_equivalent_to "[1,2,3,4]"
    a = [1, 2, 3, 4]

    scenario.push("a.#{method.to_s}(0, 0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(0, 1)").should be_equivalent_to "[1]"
    scenario.push("a.#{method.to_s}(0, 2)").should be_equivalent_to "[1, 2]"
    scenario.push("a.#{method.to_s}(0, 4)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(0, 6)").should be_equivalent_to "[1, 2, 3, 4]"
    #a.send(@method, 0, -1).should == nil
    #a.send(@method, 0, -2).should == nil
    #a.send(@method, 0, -4).should == nil

    scenario.push("a.#{method.to_s}(2, 0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(2, 1)").should be_equivalent_to "[3]"
    scenario.push("a.#{method.to_s}(2, 2)").should be_equivalent_to "[3, 4]"
    scenario.push("a.#{method.to_s}(2, 4)").should be_equivalent_to "[3, 4]"
    #a.send(@method, 2, -1).should == nil

    scenario.push("a.#{method.to_s}(4, 0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(4, 2)").should be_equivalent_to "[]"
    #a.send(@method, 4, -1).should == nil

    #a.send(@method, 5, 0).should == nil
    #a.send(@method, 5, 2).should == nil
    #a.send(@method, 5, -1).should == nil

    #a.send(@method, 6, 0).should == nil
    #a.send(@method, 6, 2).should == nil
    #a.send(@method, 6, -1).should == nil

    scenario.push("a").should be_equivalent_to "[1, 2, 3, 4]"
  end

  it "returns count elements starting at index from the end of array with [-index, count]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(-2,2)".should be_equivalent_to "['d','e']"

    scenario = ["a = [1, 2, 3, 4]"]

    scenario.push("a.#{method.to_s}(-1, 0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-1, 1)").should be_equivalent_to "[4]"
    scenario.push("a.#{method.to_s}(-1, 2)").should be_equivalent_to "[4]"
    scenario.push("a.#{method.to_s}(-1, -1)").should be_equivalent_to "nil"

    scenario.push("a.#{method.to_s}(-2, 0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-2, 1)").should be_equivalent_to "[3]"
    scenario.push("a.#{method.to_s}(-2, 2)").should be_equivalent_to "[3, 4]"
    scenario.push("a.#{method.to_s}(-2, 4)").should be_equivalent_to "[3, 4]"
    #a.send(@method, -2, -1).should == nil

    scenario.push("a.#{method.to_s}(-4, 0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-4, 1)").should be_equivalent_to "[1]"
    scenario.push("a.#{method.to_s}(-4, 2)").should be_equivalent_to "[1, 2]"
    scenario.push("a.#{method.to_s}(-4, 4)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(-4, 6)").should be_equivalent_to "[1, 2, 3, 4]"
    #a.send(@method, -4, -1).should == nil

    #a.send(@method, -5, 0).should == nil
    #a.send(@method, -5, 1).should == nil
    #a.send(@method, -5, 10).should == nil
    #a.send(@method, -5, -1).should == nil

    scenario.push("a").should be_equivalent_to "[1, 2, 3, 4]"
  end

  it "returns the first count elements with [0, count]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(0,3)".should be_equivalent_to "['a','b','c']"
  end

  xit "returns the subarray which is independent to self with [index,count]" do
    a = [1, 2, 3]
    sub = a.send(@method, 1,2)
    sub.replace([:a, :b])
    a.should == [1, 2, 3]
  end

  xit "tries to convert the passed argument to an Integer using #to_int" do
    obj = mock('to_int')
    obj.stub!(:to_int).and_return(2)

    a = [1, 2, 3, 4]
    a.send(@method, obj).should == 3
    a.send(@method, obj, 1).should == [3]
    a.send(@method, obj, obj).should == [3, 4]
    a.send(@method, 0, obj).should == [1, 2]
  end

  it "returns the elements specified by Range indexes with [m..n]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(1..3)".should be_equivalent_to '["b", "c", "d"]'
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(4..-1)".should be_equivalent_to "['e']"
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(3..3)".should be_equivalent_to "['d']"
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(3..-2)".should be_equivalent_to "['d']"
    "['a'].#{method.to_s}(0..-1)".should be_equivalent_to "['a']"

    scenario = ["a = [1, 2, 3, 4]"]

    scenario.push("a.#{method.to_s}(0..-10)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(0..0)").should be_equivalent_to "[1]"
    scenario.push("a.#{method.to_s}(0..1)").should be_equivalent_to "[1, 2]"
    scenario.push("a.#{method.to_s}(0..2)").should be_equivalent_to "[1, 2, 3]"
    scenario.push("a.#{method.to_s}(0..3)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(0..4)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(0..10)").should be_equivalent_to "[1, 2, 3, 4]"

    scenario.push("a.#{method.to_s}(2..-10)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(2..0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(2..2)").should be_equivalent_to "[3]"
    scenario.push("a.#{method.to_s}(2..3)").should be_equivalent_to "[3, 4]"
    scenario.push("a.#{method.to_s}(2..4)").should be_equivalent_to "[3, 4]"

    scenario.push("a.#{method.to_s}(3..0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(3..3)").should be_equivalent_to "[4]"
    scenario.push("a.#{method.to_s}(3..4)").should be_equivalent_to "[4]"

    scenario.push("a.#{method.to_s}(4..0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(4..4)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(4..5)").should be_equivalent_to "[]"

    #a.send(@method, 5..0).should == nil
    #a.send(@method, 5..5).should == nil
    #a.send(@method, 5..6).should == nil

    scenario.push("a").should be_equivalent_to "[1, 2, 3, 4]"
  end

  it "returns elements specified by Range indexes except the element at index n with [m...n]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(1...3)".should be_equivalent_to '["b", "c"]'

    scenario = ["a = [1, 2, 3, 4]"]

    scenario.push("a.#{method.to_s}(0...-10)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(0...0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(0...1)").should be_equivalent_to "[1]"
    scenario.push("a.#{method.to_s}(0...2)").should be_equivalent_to "[1, 2]"
    scenario.push("a.#{method.to_s}(0...3)").should be_equivalent_to "[1, 2, 3]"
    scenario.push("a.#{method.to_s}(0...4)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(0...10)").should be_equivalent_to "[1, 2, 3, 4]"

    scenario.push("a.#{method.to_s}(2...-10)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(2...0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(2...2)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(2...3)").should be_equivalent_to "[3]"
    scenario.push("a.#{method.to_s}(2...4)").should be_equivalent_to "[3, 4]"

    scenario.push("a.#{method.to_s}(3...0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(3...3)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(3...4)").should be_equivalent_to "[4]"

    scenario.push("a.#{method.to_s}(4...0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(4...4)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(4...5)").should be_equivalent_to "[]"

    #a.send(@method, 5...0).should == nil
    #a.send(@method, 5...5).should == nil
    #a.send(@method, 5...6).should == nil

    scenario.push("a").should be_equivalent_to "[1, 2, 3, 4]"
  end

  it "returns elements that exist if range start is in the array but range end is not with [m..n]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(4..7)".should be_equivalent_to "['e']"
  end

  it "accepts Range instances having a negative m and both signs for n with [m..n] and [m...n]" do
    scenario = ["a = [1, 2, 3, 4]"]

    scenario.push("a.#{method.to_s}(-1..-1)").should be_equivalent_to "[4]"
    scenario.push("a.#{method.to_s}(-1...-1)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-1..3)").should be_equivalent_to "[4]"
    scenario.push("a.#{method.to_s}(-1...3)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-1..4)").should be_equivalent_to "[4]"
    scenario.push("a.#{method.to_s}(-1...4)").should be_equivalent_to "[4]"
    scenario.push("a.#{method.to_s}(-1..10)").should be_equivalent_to "[4]"
    scenario.push("a.#{method.to_s}(-1...10)").should be_equivalent_to "[4]"
    scenario.push("a.#{method.to_s}(-1..0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-1..-4)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-1...-4)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-1..-6)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-1...-6)").should be_equivalent_to "[]"

    scenario.push("a.#{method.to_s}(-2..-2)").should be_equivalent_to "[3]"
    scenario.push("a.#{method.to_s}(-2...-2)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-2..-1)").should be_equivalent_to "[3, 4]"
    scenario.push("a.#{method.to_s}(-2...-1)").should be_equivalent_to "[3]"
    scenario.push("a.#{method.to_s}(-2..10)").should be_equivalent_to "[3, 4]"
    scenario.push("a.#{method.to_s}(-2...10)").should be_equivalent_to "[3, 4]"

    scenario.push("a.#{method.to_s}(-4..-4)").should be_equivalent_to "[1]"
    scenario.push("a.#{method.to_s}(-4..-2)").should be_equivalent_to "[1, 2, 3]"
    scenario.push("a.#{method.to_s}(-4...-2)").should be_equivalent_to "[1, 2]"
    scenario.push("a.#{method.to_s}(-4..-1)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(-4...-1)").should be_equivalent_to "[1, 2, 3]"
    scenario.push("a.#{method.to_s}(-4..3)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(-4...3)").should be_equivalent_to "[1, 2, 3]"
    scenario.push("a.#{method.to_s}(-4..4)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(-4...4)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(-4...4)").should be_equivalent_to "[1, 2, 3, 4]"
    scenario.push("a.#{method.to_s}(-4..0)").should be_equivalent_to "[1]"
    scenario.push("a.#{method.to_s}(-4...0)").should be_equivalent_to "[]"
    scenario.push("a.#{method.to_s}(-4..1)").should be_equivalent_to "[1, 2]"
    scenario.push("a.#{method.to_s}(-4...1)").should be_equivalent_to "[1]"

    #a.send(@method, -5..-5).should == nil
    #a.send(@method, -5...-5).should == nil
    #a.send(@method, -5..-4).should == nil
    #a.send(@method, -5..-1).should == nil
    #a.send(@method, -5..10).should == nil

    scenario.push("a").should be_equivalent_to "[1, 2, 3, 4]"
  end

  xit "returns the subarray which is independent to self with [m..n]" do
    a = [1, 2, 3]
    sub = a.send(@method, 1..2)
    sub.replace([:a, :b])
    a.should == [1, 2, 3]
  end

  xit "tries to convert Range elements to Integers using #to_int with [m..n] and [m...n]" do
    from = mock('from')
    to = mock('to')

    # So we can construct a range out of them...
    def from.<=>(o) 0 end
    def to.<=>(o) 0 end

    def from.to_int() 1 end
    def to.to_int() -2 end

    a = [1, 2, 3, 4]

    a.send(@method, from..to).should == [2, 3]
    a.send(@method, from...to).should == [2]
    a.send(@method, 1..0).should == []
    a.send(@method, 1...0).should == []

    lambda { a.send(@method, "a" .. "b") }.should raise_error(TypeError)
    lambda { a.send(@method, "a" ... "b") }.should raise_error(TypeError)
    lambda { a.send(@method, from .. "b") }.should raise_error(TypeError)
    lambda { a.send(@method, from ... "b") }.should raise_error(TypeError)
  end

  xit "returns the same elements as [m..n] and [m...n] with Range subclasses" do
    a = [1, 2, 3, 4]
    range_incl = ArraySpecs::MyRange.new(1, 2)
    range_excl = ArraySpecs::MyRange.new(-3, -1, true)

    a.send(@method, range_incl).should == [2, 3]
    a.send(@method, range_excl).should == [2, 3]
  end

  xit "returns nil for a requested index not in the array with [index]" do
    [ "a", "b", "c", "d", "e" ].send(@method, 5).should == nil
  end

  it "returns [] if the index is valid but length is zero with [index, length]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(0,0)".should be_equivalent_to '[]'
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(2,0)".should be_equivalent_to '[]'
  end

  xit "returns nil if length is zero but index is invalid with [index, length]" do
    [ "a", "b", "c", "d", "e" ].send(@method, 100, 0).should == nil
    [ "a", "b", "c", "d", "e" ].send(@method, -50, 0).should == nil
  end

  # This is by design. It is in the official documentation.
  it "returns [] if index == array.size with [index, length]" do
    "%w[a b c d e].#{method.to_s}(5,2)".should be_equivalent_to '[]'
  end

  xit "returns nil if index > array.size with [index, length]" do
    %w|a b c d e|.send(@method, 6, 2).should == nil
  end

  xit "returns nil if length is negative with [index, length]" do
    %w|a b c d e|.send(@method, 3, -1).should == nil
    %w|a b c d e|.send(@method, 2, -2).should == nil
    %w|a b c d e|.send(@method, 1, -100).should == nil
  end

  xit "returns nil if no requested index is in the array with [m..n]" do
    [ "a", "b", "c", "d", "e" ].send(@method, 6..10).should == nil
  end

  xit "returns nil if range start is not in the array with [m..n]" do
    [ "a", "b", "c", "d", "e" ].send(@method, -10..2).should == nil
    [ "a", "b", "c", "d", "e" ].send(@method, 10..12).should == nil
  end

  it "returns an empty array when m == n with [m...n]" do
    "[ 1, 2, 3, 4, 5].#{@method.to_s}(1...1)".should be_equivalent_to '[]'
  end

  it "returns an empty array with [0...0]" do
    "[ 1, 2, 3, 4, 5].#{method.to_s}(0...0)".should be_equivalent_to '[]'
  end

  it "returns a subarray where m, n negatives and m < n with [m..n]" do
    "[ 'a', 'b', 'c', 'd', 'e' ].#{method.to_s}(-3,-2)".should be_equivalent_to '["c","d"]'
  end

  it "returns an array containing the first element with [0..0]" do
    "[ 1, 2, 3, 4, 5].#{method.to_s}(0..0)".should be_equivalent_to '[1]'
  end

  it "returns the entire array with [0..-1]" do
    "[ 1, 2, 3, 4, 5].#{method.to_s}(0..-1)".should be_equivalent_to '[1, 2, 3, 4, 5]'
  end

  it "returns all but the last element with [0...-1]" do
    "[ 1, 2, 3, 4, 5].#{method.to_s}(0...-1)".should be_equivalent_to '[1, 2, 3, 4]'
  end

  it "returns [3] for [2..-1] out of [1, 2, 3]" do
    "[ 1, 2, 3].#{method.to_s}(2..-1)".should be_equivalent_to '[3]'
  end

  it "returns an empty array when m > n and m, n are positive with [m..n]" do
    "[ 1, 2, 3, 4, 5].#{method.to_s}(3..2)".should be_equivalent_to '[]'
  end

  it "returns an empty array when m > n and m, n are negative with [m..n]" do
    "[ 1, 2, 3, 4, 5].#{method.to_s}(-2..-3)".should be_equivalent_to '[]'
  end

  xit "does not expand array when the indices are outside of the array bounds" do
    a = [1, 2]
    a.send(@method, 4).should == nil
    a.should == [1, 2]
    a.send(@method, 4, 0).should == nil
    a.should == [1, 2]
    a.send(@method, 6, 1).should == nil
    a.should == [1, 2]
    a.send(@method, 8...8).should == nil
    a.should == [1, 2]
    a.send(@method, 10..10).should == nil
    a.should == [1, 2]
  end

  xdescribe "with a subclass of Array" do
    before :each do
      ScratchPad.clear

      @array = ArraySpecs::MyArray[1, 2, 3, 4, 5]
    end

    it "returns a subclass instance with [n, m]" do
      @array.send(@method, 0, 2).should be_an_instance_of(ArraySpecs::MyArray)
    end

    it "returns a subclass instance with [-n, m]" do
      @array.send(@method, -3, 2).should be_an_instance_of(ArraySpecs::MyArray)
    end

    it "returns a subclass instance with [n..m]" do
      @array.send(@method, 1..3).should be_an_instance_of(ArraySpecs::MyArray)
    end

    it "returns a subclass instance with [n...m]" do
      @array.send(@method, 1...3).should be_an_instance_of(ArraySpecs::MyArray)
    end

    it "returns a subclass instance with [-n..-m]" do
      @array.send(@method, -3..-1).should be_an_instance_of(ArraySpecs::MyArray)
    end

    it "returns a subclass instance with [-n...-m]" do
      @array.send(@method, -3...-1).should be_an_instance_of(ArraySpecs::MyArray)
    end

    it "returns an empty array when m == n with [m...n]" do
      @array.send(@method, 1...1).should == []
      ScratchPad.recorded.should be_nil
    end

    it "returns an empty array with [0...0]" do
      @array.send(@method, 0...0).should == []
      ScratchPad.recorded.should be_nil
    end

    it "returns an empty array when m > n and m, n are positive with [m..n]" do
      @array.send(@method, 3..2).should == []
      ScratchPad.recorded.should be_nil
    end

    it "returns an empty array when m > n and m, n are negative with [m..n]" do
      @array.send(@method, -2..-3).should == []
      ScratchPad.recorded.should be_nil
    end

    it "returns [] if index == array.size with [index, length]" do
      @array.send(@method, 5, 2).should == []
      ScratchPad.recorded.should be_nil
    end

    it "returns [] if the index is valid but length is zero with [index, length]" do
      @array.send(@method, 0, 0).should == []
      @array.send(@method, 2, 0).should == []
      ScratchPad.recorded.should be_nil
    end

    it "does not call #initialize on the subclass instance" do
      @array.send(@method, 0, 3).should == [1, 2, 3]
      ScratchPad.recorded.should be_nil
    end
  end

#  not_compliant_on :rubinius do
#    it "raises a RangeError when the start index is out of range of Fixnum" do
#      array = [1, 2, 3, 4, 5, 6]
#      obj = mock('large value')
#      obj.should_receive(:to_int).and_return(0x8000_0000_0000_0000_0000)
#      lambda { array.send(@method, obj) }.should raise_error(RangeError)
#
#      obj = 8e19
#      lambda { array.send(@method, obj) }.should raise_error(RangeError)
#    end
#
#    it "raises a RangeError when the length is out of range of Fixnum" do
#      array = [1, 2, 3, 4, 5, 6]
#      obj = mock('large value')
#      obj.should_receive(:to_int).and_return(0x8000_0000_0000_0000_0000)
#      lambda { array.send(@method, 1, obj) }.should raise_error(RangeError)
#
#      obj = 8e19
#      lambda { array.send(@method, 1, obj) }.should raise_error(RangeError)
#    end
#  end

#  deviates_on :rubinius do
#    it "raises a TypeError when the start index is out of range of Fixnum" do
#      array = [1, 2, 3, 4, 5, 6]
#      obj = mock('large value')
#      obj.should_receive(:to_int).and_return(0x8000_0000_0000_0000_0000)
#      lambda { array.send(@method, obj) }.should raise_error(TypeError)
#
#      obj = 8e19
#      lambda { array.send(@method, obj) }.should raise_error(TypeError)
#    end
#
#    it "raises a TypeError when the length is out of range of Fixnum" do
#      array = [1, 2, 3, 4, 5, 6]
#      obj = mock('large value')
#      obj.should_receive(:to_int).and_return(0x8000_0000_0000_0000_0000)
#      lambda { array.send(@method, 1, obj) }.should raise_error(TypeError)
#
#      obj = 8e19
#      lambda { array.send(@method, 1, obj) }.should raise_error(TypeError)
#    end
#  end
end
