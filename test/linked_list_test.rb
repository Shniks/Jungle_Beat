require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/linked_list'

class LinkedListTest < Minitest::Test

  def test_if_it_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
    assert_nil list.head
  end

  def test_it_can_append
    list = LinkedList.new
    list.append("doop")

    assert_instance_of Node, list.head
    assert_nil list.head.next_node
    assert_equal "doop", list.to_string
    assert_equal 1, list.count
  end



end
