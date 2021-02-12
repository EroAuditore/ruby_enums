
# rubocop:disable Style/CaseEquality
module Enumerable
    
    def my_each
        return self.dup unless block_given?
        for i in 0.. length - 1
            yield self.to_a[i]
        end
        self
    end

    def my_each_with_index
        return self.dup unless block_given?
        for i in 0.. self.length - 1
            yield  self.to_a[i] , i 
        end
    end  

    def my_each_with_index
        return self.dup unless block_given?
        for i in 0.. self.length - 1
            yield  self.to_a[i] , i 
        end
    end
    
    def my_select
        new_arr = []
        my_each do |item|
            if yield(item)
                new_arr << item
            end 
        end
        new_arr
    end

    def my_all?
        result = true
        my_each do |item|
            if !yield(item)
                result = false
            end
            break
        end
        result
    end
    
end




# rubocop:enable Style/CaseEquality