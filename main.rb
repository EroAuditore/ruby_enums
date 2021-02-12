require './enumerable.rb'

#[3, 2, 3, 4, 5].my_each { |num| puts num }

#[3, 2, 3, 4, 5].my_each_with_index { |num, index| puts "Num #{num} with index #{index}" }

#result = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun'].my_select {|friend| friend != 'Brian'}
#result = %w[ant bear cat].my_any?(/d/)  

result = %w[ant bear cat].my_all?(/t/)                        #=> false

#result = %w[ant bear cat].my_none?(/d/)                        #=> true

puts result