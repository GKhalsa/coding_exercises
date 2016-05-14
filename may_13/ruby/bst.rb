require 'pry'
class Bst
  attr_accessor :left, :right, :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(num)
    new_link = Bst.new(num)
    if num > data
      insert_right(new_link, num)
    elsif num <= data
      insert_left(new_link, num)
    end
  end

  def insert_right(new_link, num)
    if right.nil?
      @right = new_link
    else
      right.insert(num)
    end
  end

  def insert_left(new_link, num)
    if @left.nil?
      @left = new_link
    else
      left.insert(num)
    end
  end

  def sorted_data
    ordered_data = []
    ordered_data << left.sorted_data if left
    ordered_data << data
    ordered_data << right.sorted_data if right
    ordered_data.flatten
  end
end
