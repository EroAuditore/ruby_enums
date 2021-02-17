# rubocop: disable Metrics/ModuleLength
# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

module Enumerable
  def my_each
    return to_a.to_enum unless block_given?

    0.upto(to_a.length - 1) do |i|
      yield to_a[i]
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    to_a.length.times do |i|
      yield to_a[i], i
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

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
    elsif !regex.nil? && regex.instance_of?(Regexp)
      my_each do |item|
        unless regex.match(item)
          result = false
          break
        end
      end
    elsif !regex.nil? && (regex.is_a? Class)
      to_a.my_each { |item| return false unless [item.class, item.class.superclass].include?(regex) }
    elsif !block_given? && regex.nil?
      to_a.my_each { |item| return false unless item }
    else
      result = uniq.length == 1
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

    elsif !regex.nil? && regex.instance_of?(Regexp)

      my_each do |item|
        if regex.match(item)
          result = true
          break
        end
      end
    elsif !regex.nil? && (regex.is_a? Class)

      to_a.my_each { |item| return true if [item.class, item.class.superclass].include?(regex) }
    elsif !block_given? && regex.nil?

      to_a.my_each { |item| return true if item }
    elsif regex.is_a?(Class)

      to_a.my_each { |item| return true if item.is_a?(regex) }
    else
      to_a.my_each { |item| return true if item == regex }
    end
    result
  end

  def my_none?(regex = nil)
    result = true
    if block_given?
      my_each { |item| result = false if yield(item) }
    elsif !block_given? && !regex.nil? && !regex.instance_of?(Regexp)

      to_a.my_each { |item| return false if item == regex }
    elsif regex.is_a?(Regexp)

      to_a.my_each { |item| return false if regex.match?(item) }
    elsif regex.is_a?(Class)
      to_a.my_each { |item| return false if item.is_a?(regex) }
    else

      to_a.my_each { |item| return false if item }
    end
    result
  end

  def my_count(num = nil)
    count = 0
    if block_given?
      to_a.my_each { |item| count += 1 if yield(item) }
    elsif !num.nil?
      to_a.my_each { |item| count += 1 if num == item }
    elsif num.nil? && !block_given?
      to_a.my_each { |_item| count += 1 }
    end
    count
  end

  def my_map(proc = nil)
    return to_enum(:my_map) unless block_given? || proc

    arr = []
    if proc
      to_a.my_each { |item| arr << proc.call(item) }
    else
      to_a.my_each { |item| arr << yield(item) }
    end
    arr
  end

  def my_inject(num = nil, sym = nil)
    raise LocalJumpError if num.nil? && sym.nil? && !block_given?

    # Codeblock given
    if block_given? && num.nil? && sym.nil?
      # puts "block given"
      memo = num
      to_a.my_each { |item| memo = memo.nil? ? item : yield(memo, item) }
      memo

    elsif !num.nil? && num.is_a?(Symbol)
      # symbol with array
      memo = 0
      to_a.my_each { |item| memo = memo.send(num, item) }
      memo

    elsif !num.nil? && sym.is_a?(Symbol)
      # Symbol with number
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

# rubocop: enable Metrics/ModuleLength
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
def multiply_els(arr)
  arr.my_inject { |result, element| result * element }
end
