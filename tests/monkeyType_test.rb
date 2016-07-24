require 'test/unit'
require_relative '../lib/monkeyType'

using MonkeyType

class A
  def test
  end
end

class B
end

class Accepter

  def take(t)
    t.is A
    1
  end
  contract :take , option(Numeric)

  def take2(t)
    t.is B
    return false
  end
  contract :take2, boolean

end

class TestMonkeyType < Test::Unit::TestCase

  def test_accepted_type
    #A.new.is B
    #B.new.is A
    Accepter.new.take(A.new)
  end

  def test_not_accept
    Accepter.new.take2(B.new)
  end
end
