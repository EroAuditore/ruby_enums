require './enumerable.rb'

#[3, 2, 3, 4, 5].my_each { |num| puts num }

#[3, 2, 3, 4, 5].my_each_with_index { |num, index| puts "Num #{num} with index #{index}" }

#result = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun'].my_select {|friend| friend != 'Brian'}

#result = %w[ant bear cat].my_any?(/d/)  

#result = %w[ant bear cat].my_all?(/t/)                        #=> false

#result = %w[ant bear cat].my_none?(/d/)                        #=> true

#result = (1..5).my_map { |i| i * i }

#result  = (5..10).my_inject do |product, n| 
#    puts "N : #{n}  | product: #{product} "
#    product * n 
#end

#result  = (5..10).inject(:*) 
accumulator = 5
sym = :+
result = accumulator.send(sym, 3)

result  = (5..10).my_inject(:*) 


puts result