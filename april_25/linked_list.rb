class Deque
  def initialize
    @head = nil
  end

  def node_step_push(head, data)
    current_node = head
    until current_node.next_node == nil
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(data, current_node)
  end

  def node_step_pop(head)
    current_node = head
    until current_node.next_node.next_node == nil
      current_node = current_node.next_node
    end
    data = current_node.next_node.data
    current_node.next_node = nil
    data
  end

  def push(data)
    if @head.nil?
      @head = Node.new(data)
    else
      node_step_push(@head, data)
    end
  end

  def pop
    if @head.next_node.nil?
      data = @head.data
      @head = nil
    else
      data = node_step_pop(@head)
    end
    data
  end

  def shift
    data = @head.data
    if @head.next_node.nil?
      @head = nil
    else
      @head = @head.next_node
      @head.previous_node = nil
    end
    data
  end

  def unshift(data)
    if @head.nil?
      @head = Node.new(data)
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
