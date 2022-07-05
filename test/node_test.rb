require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/node'

class NodeTest < Minitest::Test

  def test_if_it_exists
    node = Node.new("plop")

    assert_instance_of Node, node 
    assert_equal "plop", node.data
    assert_nil node.next_node
  end

end
