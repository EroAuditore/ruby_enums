
# rubocop:disable Style/CaseEquality
module Enumerable
    
    def my_each
        return self.dup unless block_given?
        for i in 0.. self.length
            yield self.to_a[i]
        end
    end

    def my_each_with_index
        return self.dup unless block_given?
        for i in 0.. self.length
            yield  to_a[i] , i 
        end

    end  
end




# rubocop:enable Style/CaseEquality