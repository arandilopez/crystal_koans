describe "Arrays" do
  context "creating arrays" do
    it "should has a specific type" do
      # When creating an empty array you must always specify type
      empty_array = Array(Int32).new
      empty_array.is_a?(Array).should eq __(true)
      empty_array.size.should eq __(0)

      another_empty_array = [] of Int32
      another_empty_array.is_a?(Array).should eq __(true)
      another_empty_array.size.should eq __(0)
    end

    it "may has a combinations of types" do
      array = [1, "hello", 'x']
      array.class.should eq ___(Array(Int32 | String | Char))
    end
  end

  context "array elements" do
    it "should index all elements starting at zero" do
      array = [:peanut, :butter, :and, :jelly]

      __(:peanut).should eq array[0]
      __(:peanut).should eq array.first
      __(:jelly).should eq array[3]
      __(:jelly).should eq array.last
      __(:jelly).should eq array[-1]
      __(:butter).should eq array[-3]
    end

    it "allows you to get a slice of itself" do
      array = [:peanut, :butter, :and, :jelly]

      __([:peanut]).should eq array[0,1]
      __([:peanut, :butter]).should eq array[0,2]
      __([:and, :jelly]).should eq array[2,2]
      __([:and, :jelly]).should eq array[2,20]
      __([] of Symbol).should eq array[4,0]
      __([] of Symbol).should eq array[4,100]
      # when the given index is invalid.
      expect_raises(IndexError) do
        array[5,0]
      end
    end
  end

  describe "Range" do
    it "is not an array" do
      (1..5).class.should eq ___(Range(Int32, Int32))
      [1,2,3,4,5].should_not eq (1..5)
    end

    it "can be converted to an array" do
      (1..5).to_a.should eq __([1,2,3,4,5])
      (1...5).to_a.should eq __([1,2,3,4])
    end
  end

  context "using ranges" do
    it "can be sliced with ranges" do
      array = [:peanut, :butter, :and, :jelly]

      __([:peanut, :butter, :and]).should eq array[0..2]
      __([:peanut, :butter]).should eq array[0...2]
      __([:and, :jelly]).should eq array[2..-1]
    end
  end

  it "allows to push and pop elements" do
    array = [1,2]
    array.push(99)

    __([1, 2, 99]).should eq array

    popped_value = array.pop
    __(99).should eq popped_value
    __([1, 2]).should eq array
  end

  it "allows shifting elements" do
    array = [1,2]
    array.unshift(99)

    __([99, 1, 2]).should eq array

    shifted_value = array.shift
    __(99).should eq shifted_value
    __([1, 2]).should eq array
  end
end
