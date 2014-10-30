# require 'pry'

Node = Struct.new(:value, :next)

class List
   def initialize
      @head = nil
   end

   def add_node(node)
      node.next = @head
      @head = node
   end

   def rm_node
      aux = @head
      @head = @head.next
      aux.value
   end
 
   def head
      @head
   end
end

