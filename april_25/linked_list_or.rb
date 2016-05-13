class Deque
  def initialize
    @head = nil
    @tail = nil
  end

  def push(data)
    if @head.nil?
      @head = Node.new(data)
      @tail = @head
    else
      current_node = @head
      until current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data, current_node)
      @tail = current_node.next_node
    end
  end

  def pop
    data = @tail.data
    if @tail == @head
      @head = nil
      @tail = nil
    else
      @tail = @tail.previous_node
      @tail.next_node = nil
    end
    data
  end

  def shift
    data = @head.data
    if @tail == @head
      @head = nil
      @tail = nil
    else
      @head = @head.next_node
      @head.previous_node = nil
    end
    data
  end

  def unshift(data)
    if @head.nil?
      @head = Node.new(data)
      @tail = @head
      @head.data
    else
      @head.previous_node = Node.new(data, nil, @head)
      @head = @head.previous_node
    end
  end
end

class Node
  attr_accessor :data, :next_node, :previous_node
  def initialize(data, previous_node = nil, next_node = nil)
    @data = data
    @next_node = next_node
    @previous_node = previous_node
  end
end
