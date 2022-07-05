require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/jungle_beat'

class JungleBeatTest < Minitest::Test

  def test_if_it_exists
    jb = JungleBeat.new

    assert_instance_of JungleBeat, jb
  end

  def test_if_it_has_attributes
    jb = JungleBeat.new

    assert_instance_of LinkedList, jb.list
    assert_nil jb.list.head
  end


end
