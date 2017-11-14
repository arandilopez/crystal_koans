describe "Hash" do
  it "create an empty hash" do
    # When creating an empty hash you must always specify K and V:
    empty_hash = Hash(Int32, Int32).new
    empty_hash.class.should eq ___(Hash(Int32, Int32))
    empty_hash.should eq __({} of Int32 => Int32) # You can create an empty hash like this
    empty_hash.size.should eq __(0)
  end

  it "can create an empty hash with default values" do
    hash = { :one => "uno", :two => "dos" }
    hash.size.should eq __(2)
  end

  it "can accesses to hash elements with key" do
    hash = { :one => "uno", :two => "dos" }
    hash[:one].should eq __("uno")
    hash[:two].should eq __("dos")
    # if key doesn't exist, hash will raise a KeyError
    expect_raises KeyError do
      hash[:doesnt_exist]
    end
  end

  it "can accesses to hash elements via fetch" do
    hash = { :one => "uno" }
    hash.fetch(:one).should eq __("uno")
    expect_raises KeyError do
      hash.fetch(:doesnt_exist)
    end
  end

  it "can be changed in a value" do
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => __("eins"), :two => "dos" }
    hash.should eq __(expected)

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
  end

  it "is unordered" do
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    (hash1 == hash2).should eq __(true)
  end

  it "has an array of keys" do
    hash = { :one => "uno", :two => "dos" }
    hash.keys.size.should eq __(2)
    hash.keys.includes?(:one).should eq __(true)
    hash.keys.includes?(:two).should eq __(true)
    hash.keys.class.should eq ___(Array(Symbol))
  end

  it "has an array of values" do
    hash = { :one => "uno", :two => "dos" }
    hash.values.size.should eq __(2)
    hash.values.includes?("uno").should eq __(true)
    hash.values.includes?("dos").should eq __(true)
    hash.values.class.should eq ___(Array(String))
  end

  it "can be combined with another" do
    hash = { "jim" => 53, "amy" => 20, "dan" => 23 }
    new_hash = hash.merge({ "jim" => 54, "jenny" => 26 })

    (hash != new_hash).should eq __(true)

    expected = { "jim" => __(54), "amy" => 20, "dan" => 23, "jenny" => __(26) }
    (expected == new_hash).should eq __(true)
  end

  it "can have a default value" do
    hash1 = Hash(Symbol, String | Int32).new
    hash1[:one] = 1

    hash1[:one].should eq __(1)
    expect_raises KeyError do
      hash1[:two]
    end

    hash2 = Hash(Symbol, String | Int32).new("dos")
    hash2[:one] = 1

    hash2[:one].should eq __(1)
    hash2[:two].should eq __("dos")
  end

  it "has the same default value object" do
    hash = Hash(Symbol, Array(String)).new([] of String)

    hash[:one] << "uno"
    hash[:two] << "dos"

    hash[:one].should eq __(["uno", "dos"])
    hash[:two].should eq __(["uno", "dos"])
    hash[:three].should eq __(["uno", "dos"])

    # The same reference is used as default value
    (hash[:one].object_id == hash[:two].object_id).should eq __(true)
  end

  it "can be assigned with a default value in a passed block" do
    hash = Hash(Symbol, Array(String)).new {|hash, key| hash[key] = [] of String}

    hash[:one] << "uno"
    hash[:two] << "dos"

    # Now, for each key it has a new and different default value
    hash[:one].should eq __(["uno"])
    hash[:two].should eq __(["dos"])
    hash[:three].should eq __([] of String)
  end
end
