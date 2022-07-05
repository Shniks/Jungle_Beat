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

  def test_it_can_insert_a_node
    list = LinkedList.new
    list.append("plop")
    list.append("suu")
    list.prepend("dop")
    list.insert(1, "woo")

    assert_equal "dop woo plop suu", list.to_string
    assert_equal 4, list.count

    list.insert(3, "gloop")

    assert_equal "dop woo plop gloop suu", list.to_string

    list.insert(4, "boop")

    assert_equal "dop woo plop gloop boop suu", list.to_string
  end

  def test_it_can_find_a_node
    list = LinkedList.new
    list.append("shi")
    list.append("shu")
    list.append("blop")
    list.prepend("deep")
    list.insert(1, "woo")

    result_1 = list.find(2, 1)
    result_2 = list.find(1, 3)

    assert_equal "deep woo shi shu blop", list.to_string
    assert_equal "shi", result_1
    assert_equal "woo shi shu", result_2
  end

  def test_it_has_can_find_if_a_value_is_included
    list = LinkedList.new
    list.append("shi")
    list.append("shu")
    list.append("blop")
    list.prepend("deep")
    list.insert(1, "woo")

    result_1 = list.includes?("deep")
    result_2 = list.includes?("dep")

    assert result_1
    refute result_2
  end

end
