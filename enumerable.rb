
# rubocop:disable Style/CaseEquality
module Enumerable
    
    def my_each
        return self.dup unless block_given?
        length.times do |i|
            yield to_a[i]
          end
    end

    def my_each_with_index
        return self.dup unless block_given?

    end  
end




# rubocop:enable Style/CaseEquality