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

  def test_it_can_append
    jb = JungleBeat.new

    assert_equal "deep doo ditt", jb.append("deep doo ditt")
    assert_equal "deep", jb.list.head.data
    assert_equal "doo", jb.list.head.next_node.data
    assert_equal 3, jb.count
  end

  def test_it_can_append_a_second_string
    jb = JungleBeat.new
    jb.append("deep doo ditt")

    assert_equal "woo hoo shu", jb.append("woo hoo shu")
    assert_equal 6, jb.count
  end

  def test_it_can_play_a_sound
    jb = JungleBeat.new
    jb.append("deep doo ditt woo hoo shu")

    assert_equal 6, jb.count
    assert_equal 6, jb.list.count
    jb.play
  end

  def test_it_can_play_a_song
    jb = JungleBeat.new
    jb.append("I don't want a lot for christmas")
    jb.append("There is just one thing I need")
    jb.append("I don't care about the presents")
    jb.append("Underneath the Christmas Treeeeeeeeeeeeeeee")
    jb.append("I just want you for my own")
    jb.append("More than you could even know")
    jb.append("Make my wish come true hoo")
    jb.append("All I want for Christmas is youuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu hoooooooooooooooooooooooooooooooo")

    assert_equal 51, jb.list.count
    jb.play
  end

end
