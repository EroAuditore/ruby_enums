module Enumerable
  def my_each
    return dup unless block_given?

    (0..length - 1).each do |i|
      yield to_a[i]
    end
    self
  end

  def my_each_with_index
    return dup unless block_given?

    (0..length - 1).each do |i|
      yield to_a[i], i
    end
  end

  def my_each_with_index
    return dup unless block_given?

    (0..length - 1).each do |i|
      yield to_a[i], i
    end
  end

  def my_select
    new_arr = []
    my_each do |item|
      new_arr << item if yield(item)
    end
    new_arr
  end

  def my_all?(regex = nil)
    result = true
    if block_given?
      my_each do |item|
        unless yield(item)
          result = false
          break
        end
      end
    elsif !regex.nil?
      my_each do |item|
        unless regex.match(item)
          result = false
          break
        end
      end
    end
    result
  end

  def my_any?(regex = nil)
    result = false
    if block_given?
      my_each do |item|
        if yield(item)
          result = true
          break
        end
      end
    elsif !regex.nil?
      my_each do |item|
        if regex.match(item)
          result = true
          break
        end
      end
    end
    result
  end

  def my_none?(regex = nil)
    result = true
    if block_given?
      my_each { |item| result = false if yield(item) }
    elsif !regex.nil?
      my_each { |item| result = false unless regex.match(item) }
    end
    result
  end

  def my_count(num = nil)
    count = 0
    if block_given?
      my_each { |item| count += 1 if yield(item) }
    elsif !num.nil?
      my_each { |item| count += 1 if num == item }
    elsif num.nil? && !block_given?
      my_each { |_item| count += 1 }
    end
    count
  end

  def my_map(proc = nil)
    return dup unless block_given? || proc

    arr = []
    if proc
      to_a.my_each { |item| arr << proc.call(item) }
    else
      to_a.my_each { |item| arr << yield(item) }
    end
    arr
  end

  def my_inject(num = nil, sym = nil)
    # Codeblock given
    if block_given? && num.nil? && sym.nil?
      # puts "block given"
      memo = num
      to_a.my_each { |item| memo = memo.nil? ? item : yield(memo, item) }
      memo
    # symbol with array
    elsif !num.nil? && num.is_a?(Symbol)
      # puts "symbol"
      sym = num
      to_a.my_each { |item| memo = num.send(sym, item) }
      memo
    # Symbol with number
    elsif !num.nil? && sym.is_a?(Symbol)
      # puts "number and symbol"
      to_a.my_each { |item| memo = memo.nil? ? item.send(sym, num) : memo.send(sym, item) }
      memo
    # number and codeblock
    elsif !num.nil? && block_given? && sym.nil?
      # puts "Num & block_given"
      to_a.my_each { |item| memo = memo.nil? ? yield(num, item) : yield(memo, item) }
      memo

    end
  end
end

def multiply_els(arr)
  arr.my_inject { |result, element| result * element }
end
