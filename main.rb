require './enumerable'

puts '** My Each **'
m_each = [3, 2, 3, 4, 5].my_each { |num| puts num }
puts m_each

puts '** My Each index **'
m_each_index = [3, 2, 3, 4, 5].my_each_with_index { |num, index| puts "Num #{num} with index #{index}" }
puts m_each_index

puts '** My select **'
puts m_select = %w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' }
puts m_select

puts '** My any **'

m_any = %w[ant bear cat].my_any?(/b/)
puts m_any

puts '** My all **'
m_all = %w[ant bear cat].my_all?(/t/)
puts m_all

puts '** My none **'
m_none = %w[ant bear cat].my_none?(/d/)
puts m_none

puts '* My map *'
my_proc = proc { |i| i * i }
m_map = [2, 5, 7, 4, 2].my_map(my_proc)
puts m_map

puts 'My inject'
m_inject_num = (5..10).inject(:*)
puts m_inject_num

puts 'My inject strings'
m_inject_str = %w[cat sheep sheepeta bear].my_inject do |memo, word|
  memo.length > word.length ? memo : word
end
puts m_inject_str

puts 'Multiply inject'
multply = multiply_els([2, 4, 5])
puts 'Multiply'
