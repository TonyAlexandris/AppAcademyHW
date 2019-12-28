arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#=> "fiiiissshhhhhh"

def sluggish(arr)
    longest = arr[0]
    arr.each do |fish1|
        arr.each do |fish2|
            longest = fish1 if fish1.length > fish2.length && fish1.length > longest.length
        end
    end
    longest
end

def dominant(arr)
    merge_sort(arr).last
end

def merge_sort(arr)
    return arr if arr.length <= 1
    mid = arr.length / 2
    left = arr.take(mid)
    right = arr.drop(mid)
    merge(merge_sort(left),merge_sort(right))
end

def merge(ele1, ele2)
    merged = []
    until ele1.empty? || ele2.empty?
        compare = ele1.first.length <=> ele2.first.length
        if compare == 1
            merged << ele2.shift
        else
            merged << ele1.shift
        end
        merged.concat(ele1) if ele2.empty?
        merged.concat(ele2) if ele1.empty?
    end
    merged
end

def clever(arr)
    longest = ""
    arr.each {|fish| longest = fish if fish.length > longest.length}
    longest
end

puts sluggish(arr)
puts dominant(arr)
puts clever(arr)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
    tiles_array.each_with_index {|tile, i| return i if tile == direction}
end

print slow_dance("up", tiles_array)
print slow_dance("right-down", tiles_array)

new_tiles_data_structure = Hash.new(0)
tiles_array.each_with_index {|tile, i| new_tiles_data_structure[tile] = i}

def fast_dance(direction, new_tiles_data_structure)
    new_tiles_data_structure[direction]
end

print fast_dance("up", new_tiles_data_structure)
print fast_dance("right-down", new_tiles_data_structure)