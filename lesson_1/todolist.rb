# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

# todo1 = Todo.new("Buy milk")
# todo2 = Todo.new("Clean room")
# todo3 = Todo.new("Go to gym")
# todo1.done!
# puts todo1
# puts todo2
# puts todo3


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation

  def add(todo)
    raise TypeError.new("Can only add Todo objects") unless Todo === todo
    todos << todo
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos.clone
  end

  def done?
    todos.map(&:done).all?
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << @todos.join("\n")
    text
  end

  def each
    todos.each { |todo| yield(todo) }
    todos
  end

  private

  attr_accessor :todos
end


# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
puts list.add(todo1)                 # adds todo1 to end of list, returns list
puts list.add(todo2)                 # adds todo2 to end of list, returns list
puts list << todo3                 # adds todo3 to end of list, returns list
# puts list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

puts list

# ---- Interrogating the list -----

# size
# puts list.size                       # returns 3

# first
# puts list.first                      # returns todo1, which is the first item in the list

# last
# puts list.last                       # returns todo3, which is the last item in the list

#to_a
# p list.to_a                      # returns an array of all items in the list

#done?
# puts list.done?                     # returns true if all todos in the list are done, otherwise false


# ---- Retrieving an item in the list ----

# item_at
# list.item_at                    # raises ArgumentError
# puts list.item_at(1)                 # returns 2nd item in list (zero based index)
# list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
# list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
puts list
# list.mark_done_at(100)          # raises IndexError

# mark_undone_at
# list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
puts list
# list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done
puts list
# ---- Deleting from the list -----

# shift
# list.shift                      # removes and returns the first item in list
# puts list
# pop
# list.pop                        # removes and returns the last item in list
# puts list

# remove_at
# list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# puts list
# list.remove_at(100)             # raises IndexError
=begin
# ---- Outputting the list -----

# to_s
puts list                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
=end