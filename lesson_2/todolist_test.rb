require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos , @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @todo1.done!
    @todo2.done!
    assert_equal(false, @list.done?)
    @todo3.done!
    assert_equal(true, @list.done?)
  end

  def test_TypeError
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('hi') }
  end

  def test_shove
    todo4 = Todo.new("Yoga")
    @todos << todo4
    @list << todo4
    assert_equal(@todos, @list.to_a)
  end

  def test_add
    todo4 = Todo.new("Yoga")
    @todos << todo4
    @list.add(todo4)
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(ArgumentError) { @list.item_at }
    assert_raises(IndexError) { @list.item_at(100) }
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(ArgumentError) { @list.mark_done_at }
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(ArgumentError) { @list.mark_undone_at }
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todos.each(&:done!)
    @list.mark_undone_at(1)  
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(ArgumentError) { @list.remove_at }
    assert_raises(IndexError) { @list.remove_at(100) }
    removed = @list.remove_at(1)
    assert_equal(@todo2, removed)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    expected = <<~EXPECTED.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    EXPECTED
  
    assert_equal(expected, @list.to_s)
  end

  def test_to_s_2
    @list.mark_done_at(1)

    expected = <<~EXPECTED.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    EXPECTED
  
    assert_equal(expected, @list.to_s)
  end

  def test_to_s_3
    @list.done!

    expected = <<~EXPECTED.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    EXPECTED
  
    assert_equal(expected, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result)
  end

  def test_each_2
    return_value = @list.each {}
    assert_equal(@list, return_value)
  end

  def test_select
    @list.mark_done_at(1)
    selected = @list.select { |todo| todo.done? }

    new_list = TodoList.new(@list.title)
    new_list << @todo2

    assert_equal(new_list.title, @list.title)
    assert_equal(new_list.to_a, selected.to_a)
  end
end