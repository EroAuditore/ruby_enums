
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

    def my_all?(regex=nil)
        result = true
        if  block_given?
            my_each do |item|
                if !yield(item)
                    result = false
                    break
                end
            end
        elsif !regex.nil?
            my_each do |item|
                if  !regex.match(item)
                    result = false
                    break
                end
            end
        end
        result
    end

    def my_any?
        result = false
        my_each { |item| result = true if yield(item) }
        result
    end

    def my_none?(regex=nil)
        result = true
        if block_given?
            my_each { |item|  result = false if yield(item)} 
        elsif  !regex.nil?
            my_each { |item|  result = false if regex.match(item)} 
        end
        result
    end
    
    
end




# rubocop:enable Style/CaseEquality