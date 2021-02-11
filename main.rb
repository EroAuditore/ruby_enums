require './enumerable.rb'

[3, 2, 3, 4, 5].my_each { |num| puts num }

[3, 2, 3, 4, 5].my_each_with_index { |num, index| puts "Num #{num} with index #{index}" }