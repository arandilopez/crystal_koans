class MyNewClass
end

describe "Objects" do
  context "everything is a object" do
    it "asserts" do
      1.is_a?(Object).should eq __(true)
      1.5.is_a?(Object).should eq __(true)
      "string".is_a?(Object).should eq __(true)
      nil.is_a?(Object).should eq __(true)
      Class.is_a?(Object).should eq __(true)
    end
  end

  context "objects can be converted to string" do
    it "asserts" do
      123.to_s.should eq __("123")
      nil.to_s.should eq __("")
    end
  end

  context "objects can be inspected" do
    it "asserts" do
      123.inspect.should eq __("123")
      nil.inspect.should eq __("nil")
      "hello".inspect.should eq __(%{"hello"})
    end
  end

  describe "Value" do
    context "basic types are values" do
      it "asserts" do
        1.is_a?(Value).should eq __(true)
        1.5.is_a?(Value).should eq __(true)
        true.is_a?(Value).should eq __(true)
        nil.is_a?(Value).should eq __(true)
      end
    end
  end

  describe "Reference" do
    it "should be a object" do
      obj = Reference.new()
      obj.is_a?(Object).should eq __(true)
    end

    context "any class extends from Reference" do
      obj = MyNewClass.new
      obj.is_a?(Reference).should eq __(true)
      obj.is_a?(Object).should eq __(true)
    end

    context "every reference has an id" do
      it "asserts" do
        obj = Reference.new()
        obj.object_id.is_a?(Number).should eq __(true)
      end
    end

    context "every reference has different id" do
      it "asserts" do
        obj = Reference.new()
        another_obj = Reference.new()
        (obj.object_id != another_obj.object_id).should eq __(true)
      end
    end

    context "dup create a different reference" do
      it "asserts" do
        obj = Reference.new()
        dup_obj = obj.dup
        (obj != dup_obj).should eq __(true)
        (obj.object_id != dup_obj.object_id).should eq __(true)
      end
    end
  end
end
