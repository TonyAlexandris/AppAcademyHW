class Stack

    attr_accessor :stack
    def initialize
        @stack = []
    end

    def push(el)
        stack << el
    end

    def pop
        stack.pop
    end

    def peek
        stack[-1]
    end
end

#a = Stack.new
#a.push(1).push(2).push(3).push(4).push(5)
#print a.stack
#2.times {a.pop}
#print a.peek
#print a.stack
