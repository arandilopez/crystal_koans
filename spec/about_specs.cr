
describe "Specs" do
  # We shall contemplate truth by testing reality, via matchers.
  it "should test the truth" do
    true.should be_true
    false.should be_false
  end

  # To understand reality, we must compare our expectations against
  # reality.
  it "should test equality" do
    expected_value = 2
    actual_value = 1 + 1
    are_equal = expected_value == actual_value
    are_equal.should be_true
  end

  # Some ways of asserting equality are better than others.
  it "should test equality is a better way" do
    expected_value = 2
    actual_value = 1 + 1
    expected_value.should eq actual_value
  end

  # Sometimes we will ask you to fill in the values
  it "should ask you to fill in value" do
    __(2).should eq 1 + 1
  end
end
