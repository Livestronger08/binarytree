class BinaryTree
    attr_accessor :payload, :left, :right

    def initialize(payload, left, right)
        @payload = payload
        @left = left
        @right = right
    end

    def add_node(num)
        if num < @payload
            if @left == nil
                @left = BinaryTree.new(num, nil, nil)
            else
                @left.add_node(num)
            end
        elsif num > @payload
            if @right == nil
                @right = BinaryTree.new(num, nil, nil)
            else
                @right.add_node(num)
            end
        end
    end

    def get_sorted_array
        sort_array = []

        if @left != nil
            sort_array += @left.get_sorted_array
        end

        sort_array.push(@payload)

        if @right != nil
            sort_array += @right.get_sorted_array
        end

        return sort_array
    end

end

def sort(array)
    
    root = BinaryTree.new(array[0], nil, nil)

    array[1..-1].each do |num|
        root.add_node(num)
    end

    return root.get_sorted_array
end

puts "The Binary Tree is sorted as #{sort([7, 4, 9, 1, 6, 14, 10])}"


seven = BinaryTree.new(7, nil, nil)
five = BinaryTree.new(5, nil, nil)
four = BinaryTree.new(4, nil, nil)
six = BinaryTree.new(6, nil, seven)
three = BinaryTree.new(3, nil, six)
two = BinaryTree.new(2, four, five)
trunk = BinaryTree.new(1, two, three)

[7, 4, 9, 1, 6, 14, 10]