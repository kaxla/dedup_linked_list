class Node
  attr_accessor :current, :previous, :nexxt

  def initialize(current, previous, nexxt)
    @current = current
    @previous = previous
    @nexxt = nexxt
  end

end

class List
  attr_accessor :head, :tail

  def initialize
    @tail = nil
    @head = nil
  end

  def add(num)
    new_node = Node.new(num, @tail, nil)
    @head = new_node if head.nil?
    @tail.nexxt = new_node unless @tail.nil?
    @tail = new_node

  end

  def print
    node = @head
    while !node.nil?
      puts node.current #(node.current.to_s + ", ")
      node = node.nexxt
    end
  end

  def delete(node)
    if node == @head
      @head = node.nexxt
    end
    node.previous.nexxt = node.nexxt unless node.previous.nil?
    node.nexxt.previous = node.previous unless node.nexxt.nil?
  end

  def dedupe
    current_node = @head
    duplicates = Array.new
    while(!current_node.nil?) do
      value = current_node.current
      next_node = current_node.nexxt

      if duplicates.include? value
        delete(current_node)
      else
        duplicates << value
      end

      current_node = next_node
    end
  end
end

list = List.new
200.times do |n|
  list.add(rand(100))
end

list.print
list.dedupe
puts "--------------------------"
list.print




