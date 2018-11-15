require 'test/unit'
require_relative 'array'

class MyArrayTest < Test::Unit::TestCase
  def setup
    @array = MyArray.new(3)
  end

  def test_check_overflow
    array = MyArray.new(3) { |index| index**2 }
    array.count = 3
    assert_nil(array.check_overflow(3))
    assert_nil(array.check_overflow(-1))
  end

  def test_insert_when_array_empty
    @array.insert(1, 5)
    assert_equal(5, @array.arr[0])
  end

  def test_insert_when_array_has_many_data
    @array.arr[0] = 1
    @array.arr[1] = 2
    @array.count = 2
    @array.insert(0, 4)
    assert_equal(4, @array.arr[0])
    assert_equal(1, @array.arr[-1])
  end

  def test_insert_when_index_less_then_zero
    @array.arr[0] = 1
    @array.arr[1] = 2
    @array.count = 2
    @array.insert(-1, 4)
    assert_equal(4, @array.arr[0])
    assert_equal(1, @array.arr[1])
  end

  def test_insert_to_tail
    @array.arr[0] = 1
    @array.arr[1] = 2
    @array.count = 2
    @array.insert_to_tail(4)
    assert_equal(4, @array.arr[-1])
  end

  def test_delete
    @array.arr[0] = 1
    @array.arr[1] = 2
    @array.count = 2
    @array.delete(1)
    assert_equal(nil, @array.arr[1])
    assert_equal(1, @array.arr.length)
  end
end
