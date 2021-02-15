require './enumerable.rb'


#[3, 2, 3, 4, 5].my_each { |num| puts num }

#[3, 2, 3, 4, 5].my_each_with_index { |num, index| puts "Num #{num} with index #{index}" }

#result = ['Sharon', 'Leo', 'Leila', 'Brian', 'Arun'].my_select {|friend| friend != 'Brian'}

#result = %w[ant bear cat].my_any?(/d/)  

#result = %w[ant bear cat].my_all?(/t/)                        #=> false

#result = %w[ant bear cat].my_none?(/d/)                        #=> true

result = (1..5).my_map { |i| i * i }
puts "Map yield: " 
puts result
puts 'my_map proc'
my_proc = proc { |i| i * i }
[2, 5, 7, 4, 2].my_map(my_proc)
puts my_proc

#result  = (5..10).my_inject do |product, n| 
#    puts "N : #{n}  | product: #{product} "
#    product * n 
#end

#result  = (5..10).inject(:*) 
accumulator = 5
sym = :+
result = accumulator.send(sym, 3)

#result  = (5..10).my_inject(:*)
#result = (5..10 ).my_inject(1, :*)  

result = (5..10).my_inject(1) { |product, n|  product * n } #=> 151200

longest = %w{ cat sheep sheepeta bear }.my_inject do |memo, word|
    memo.length > word.length ? memo : word
 end

#multply = multiply_els([2, 4, 5])

