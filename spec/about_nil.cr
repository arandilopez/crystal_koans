describe "Nil" do
  it "should be a object" do
    nil.is_a?(Nil).should eq __(true)
    nil.is_a?(Value).should eq __(true)
    nil.is_a?(Object).should eq __(true)
  end

  it "has some methods" do
    nil.nil?.should eq __(true)
    nil.same?(nil).should eq __(true)
    nil.same?("").should eq __(false)
    nil.to_s.should eq __("")
    nil.inspect.should eq __("nil")
    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
  end

  it "should raise a exception if we assume a value is not nil" do
    str = "Hello world"
    # Tell the compiler that we are sure the returned
    # value is not nil: raises a runtime exception
    # if our assumption doesn't hold.
    expect_raises Exception, "Nil assertion failed" do
      idx = str.index('a').not_nil!
    end

  end
end
