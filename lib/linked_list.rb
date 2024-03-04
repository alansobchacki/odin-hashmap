# frozen_string_literal: true

# Builds a very simple linked list
# Useful to help us deal with collisions
class LinkedList
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = @head
  end

  def append(key, value)
    new_node = {
      'user': key,
      'value': value
    }
    @head = new_node if @head.nil?
    @tail = new_node
  end
end
