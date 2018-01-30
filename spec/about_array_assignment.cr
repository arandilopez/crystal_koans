describe "Array assignment" do
  context "in Crystal" do
    it "can parallel assign" do
      first_name, last_name = ["John", "Smith"]
      first_name.should eq __("John")
      last_name.should eq __("Smith")
    end

    it "can parallel assign with extra values" do
      first_name, last_name = ["John", "Smith", "III"]
      first_name.should eq __("John")
      last_name.should eq __("Smith")
      # Until now, Crystal can not assing using a splat operator
      # Eg. first_name, *last_name = ["John", "Smith", "III"]
      # This is not valid in crystal
    end

    it "with parallel assign with few values raises an exception" do
      # Trying to assing something missing will raise an IndexError
      expect_raises IndexError do
        first_name, last_name = ["Cher"]
      end
    end

    it "can parallel assign with nested arrays" do
      first_name, last_name = [["Willie", "Rae"], "Johnson"]
      first_name.should eq __(["Willie", "Rae"])
      last_name.should eq __("Johnson")
    end

    it "can swap values with parallel assignment" do
      first_name = "Roy"
      last_name = "Rob"
      first_name, last_name = last_name, first_name
      first_name.should eq __("Rob")
      last_name.should eq __("Roy")
    end
  end
end
