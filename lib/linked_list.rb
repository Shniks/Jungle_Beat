require_relative 'node'
require 'pry'

class LinkedList

  attr_reader :head, :count

  def initialize
    @head = nil
    @count = 0
  end

  def append(data)
    if head.nil?
      @head = Node.new(data)
    else
      current_node = head
      append_traverse(current_node, data)
    end
    @count += 1
  end

  def append_traverse(current_node, data)
    while current_node.next_node != nil
      current_node = current_node.next_node # How to test this code as it is for traversing?
    end
    current_node.next_node = Node.new(data)
  end

  def to_string
    current_node = head
    song = ""
    song << current_node.data
    total_data_pieces = 1
    string_traverse(current_node, song, total_data_pieces)
  end

  def string_traverse(current_node, song, total_data_pieces)
    while current_node.next_node != nil
      current_node = current_node.next_node
      song << " #{current_node.data}"
      total_data_pieces += 1
    end
    song
  end

  def prepend(data)
    current_head = head
    @head = Node.new(data)
    head.next_node = current_head
    @count += 1
  end

  def insert(location, data)
    current_node = head
    (location - 1).times do
      current_node = current_node.next_node
    end
    inserted_node = Node.new(data)
    inserted_node.next_node = current_node.next_node
    current_node.next_node = inserted_node
    @count += 1
  end

end
