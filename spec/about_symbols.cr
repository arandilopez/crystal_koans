describe "Symbols" do
  it "is a symbol" do
    :crystal.is_a?(Symbol).should eq __(true)
  end

  it "can be compared to others symbols" do
    symbol1 = :a_symbol
    symbol2 = :a_symbol
    symbol3 = :something_else

    (symbol1 == symbol2).should eq __(true)
    (symbol1 == symbol3).should eq __(false)
  end

  # it "can " do
  #
  # end
end
