describe "String" do
  it "is a double quoted string" do
    string = "Hello, World"
    string.is_a?(String).should eq __(true)
  end

  it "is not a single quoted string" do
    string = 'A'
    string.is_a?(String).should eq __(false)
    # Single quote is used onlye for chars
    string.is_a?(Char).should eq __(true)
  end

  it "can contain single quotes" do
    string = "Don't"
    string.should eq __("Don't")
  end

  it "can can span multiple lines" do
    a = "Hello
    world"
    a.should eq __("Hello\n    world")
  end

  it "can split in multiple lines to avoid new lines chars" do
    a = "hello " \
        "world, " \
        "no newlines"

    a.should eq __("hello world, no newlines")

    b = "I don't \
        have \
        newlines"

    b.should eq __("I don't have newlines")
  end

  it "supports flexible quoting" do
    # Supports double quotes and nested parenthesis
    %(hello ("world")).should eq __("hello (\"world\")")
    # Supports double quotes and nested brackets
    %[hello ["world"]].should eq __("hello [\"world\"]")
    # Supports double quotes and nested curlies
    %{hello {"world"}}.should eq __("hello {\"world\"}")
    # Supports double quotes and nested angles
    %<hello <"world">>.should eq __("hello <\"world\">")
  end

  it "sums to concatenate to other strings" do
    string = "Hello, " + "World"
    string.should eq __("Hello, World")
  end

  it "keeps unmodified with a plus concatenation" do
    hi = "Hello, "
    there = "World"
    string = hi + there
    hi.should eq __("Hello, ")
    there.should eq __("World")
  end

  it "plus equals concatenate to the end of the string" do
    hi = "Hello, "
    there = "World"
    hi += there
    hi.should eq __("Hello, World")
    there.should eq __("World")
  end

  context "string interpolation" do
    it "interpolates variables" do
      value = 123
      string = "The value is #{value}"
      string.should eq __("The value is 123")
    end

    it "interpolates any crystal expression" do
      string = "The square root of 5 is #{Math.sqrt(5)}"
      string.should eq __("The square root of 5 is 2.23606797749979")
    end
  end

  it "brackets operator may return a subtring" do
    string = "Bacon, lettuce and tomato"
    string[7,3].should eq __("let")
    string[(7..9)].should eq __("let")
  end

  it "brackets operator also return a single char" do
    string = "Bacon, lettuce and tomato"
    string[1].should eq __('a')
  end

  it "can be splited" do
    string = "Sausage Egg Cheese"
    words = string.split
    words.should eq [__("Sausage"), __("Egg"), __("Cheese")]
  end

  it "can be splited by a pattern" do
    string = "the:rain:in:spain"
    words = string.split(/:/)
    words.should eq [__("the"), __("rain"), __("in"), __("spain")]
    # NOTE: Patterns are formed from Regular Expressions.
    # Crystal has a very powerful Regular Expression library.
    # We will become enlightened about them soon.
  end

  it "can be joined with others strings" do
    words = ["Now", "is", "the", "time"]
    words.join(" ").should eq __("Now is the time")
  end

  context "single quotes are use for chars" do
    describe "Char" do
      it "is a char" do
        c = 'H'
        c.is_a?(Char).should eq __(true)
        c.is_a?(String).should eq __(false)
      end

      it "escapes sequences" do
        backslash = '\\'
        newline = '\n'
        backslash.is_a?(Char).should eq __(true)
        newline.is_a?(Char).should eq __(true)
      end

      it "can be represent by unicode" do
        '\u0041'.should eq __('A')
        '\u{41}'.should eq __('A')
      end
    end
  end
end
