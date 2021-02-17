require './enumerable'

#My none

puts %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
puts %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
puts %w{ant bear cat}.my_none?(/d/)                        #=> true
puts [1, 3.14, 42].my_none?(Float)                         #=> false
puts [].my_none?                                           #=> true
puts [nil].my_none?                                        #=> true
puts [nil, false].my_none?                                 #=> true
puts [nil, false, true].my_none?                           #=> false

#My Any

puts %w[ant bear cat].my_any? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_any? { |word| word.length >= 4 } #=> true
puts %w[ant bear cat].my_any?(/d/)                        #=> false
puts [nil, true, 99].my_any?(Integer)                     #=> true
puts [nil, true, 99].my_any?                              #=> true
puts [].my_any?                                           #=> false

# My all
puts %w[ant bear cat].my_all? { |word| word.length >= 3 } #=> true
puts %w[ant bear cat].my_all? { |word| word.length >= 4 } #=> false
puts %w[ant bear cat].my_all?(/t/) #=> false
puts [1, 2i, 3.14].my_all?(Numeric) #=> true
puts [nil, true, 99].my_all? #=> false
puts [].my_all? #=> true

puts '** My Each **'
[3, 2, 3, 4, 5].my_each { |num| puts num }
friends = %w[Sharon Leo Leila Brian Arun]
friends.my_each { |friend| puts "Hello, #{friend}" }

puts '** My Each index **'
[3, 2, 3, 4, 5].my_each_with_index { |num, index| puts "Num #{num} with index #{index}" }

puts '** My select **'
puts m_select = %w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' }
responses = { 'Sharon' => 'yes', 'Leo' => 'no', 'Leila' => 'no', 'Arun' => 'yes' }
puts responses.my_select { |_person, response| response == 'yes' }

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
puts multply
