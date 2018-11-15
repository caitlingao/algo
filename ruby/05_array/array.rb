class MyArray
  attr_reader :capacity
  attr_accessor :count, :arr

  def initialize(capacity)
    @capacity = capacity
    @count    = 0
    @arr      = Array.new(capacity)
  end

  def find(index)
    arr[index]
  end

  def insert(index, value)
    check_overflow(index)

    # 数组已满
    return if @count == capacity

    case
    when index >= @count # 数组还有空间，index 位置大于等于数据数量，数据插入到最后
      arr[@count] = value
    when index >= 0 # 数组还有空间，index 位置小于数据数量，数据被插入且原有数据被移至数组末尾
      arr[-1]    = arr[index]
      arr[index] = value
    when index < 0 # index 小于 0，数据插入到第一个位置
      arr.unshift(value)
    end

    @count += 1
  end

  def insert_to_tail(value)
    arr.push(value)
    @count += 1
  end

  def delete(index)
    check_overflow(index)

    arr[index] = nil
    arr.select! { |m| !m.nil? }

    @count -= 1
  end

  def puts_all
    arr
  end

  # 数组已存满或者 index 位置小于 -capacity
  def check_overflow(index)
    return if index >= capacity || index < -capacity
  end
end
