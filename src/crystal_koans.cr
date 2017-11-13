require "./crystal_koans/*"

module CrystalKoans
  class FillMeInException < Exception
  end

  def __(value : (Object) = "FILL ME IN")
    return value
  end

  def ___(value : (Class) = FillMeInException)
    return value
  end
end
