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

  def test_it_can_append_a_single_node
    list = LinkedList.new
    list.append("doop")

    assert_instance_of Node, list.head
    assert_nil list.head.next_node
    assert_equal "doop", list.to_string
    assert_equal 1, list.count
  end

  def test_it_can_append_multiple_nodes
    list = LinkedList.new
    list.append("doop")
    list.append("deep")

    assert_instance_of Node, list.head.next_node
    assert_nil list.head.next_node.next_node
    assert_equal 2, list.count
    assert_equal "doop deep", list.to_string
  end

  def test_it_can_prepend_a_node
    list = LinkedList.new
    list.append("plop")

    assert_equal "plop", list.to_string

    list.append("suu")
    list.prepend("dop")

    assert_equal "dop plop suu", list.to_string
    assert_equal 3, list.count
  end

end
