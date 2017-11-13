require "./crystal_koans/*"

module CrystalKoans
  class FillMeInException < Exception
  end

  def __s(value = "FILL ME IN")
    return value
  end

  def __b(value = false)
    return value
  end

  def __i(value = 99_999)
    return value
  end

  def ___(value = FillMeInException)
    return value
  end
end
