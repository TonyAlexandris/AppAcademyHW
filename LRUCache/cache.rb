class LRUCache
    def initialize(size)
        @cache = []
        @size = size
    end

    def count
      # returns number of elements currently in cache
        @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
        found = false
        @cache.each_with_index do |ele, i|
            if el == ele
                found = true
                @cache.delete_at(i)
                @cache.push(el)
                break
            end
        end
        if !found
            @cache.shift if count == @size
            @cache.push(el)
        end
    end

    def show
      # shows the items in the cache, with the LRU item first
        print @cache
    end

    private
    # helper methods go here!

end