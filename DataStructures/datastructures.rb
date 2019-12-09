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
class Queue
    attr_accessor :queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        queue.push(el)
    end

    def dequeue
        queue.shift
    end

    def peek
        queue[0]
    end
end

#a = Queue.new
#a.enqueue(1)
#a.enqueue(2)
#print a.peek
#a.dequeue
#print a.peek
#print a.queue

class Map
    attr_accessor :map
    def initialize
        @map = []
    end

    def set(key, val)
        found = false
        map.each do |pair| 
            if pair[0] == key
                pair[1] = val
                found = true
            end
        end 
        map << [key, val] if found == false
    end

    def get(key)
        map.each {|pair| return pair[1] if pair[0] == key}
        return nil
    end

    def delete(key)
        map.reject! {|pair| pair[0] == key}
    end

    def show
        print map
        puts
    end
end

#a = Map.new
#a.set("a", 1)
#a.set("b", 2)
#a.set("c", 3)
#a.set(4, "d")
#a.show
#a.set("a", 2)
#a.show
#print a.get("a")
#puts
#print a.get("q")
#puts
#a.delete("a")
#print a.get("a")
#puts
#a.show