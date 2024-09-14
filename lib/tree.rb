require_relative 'node'
require_relative 'merge_sort/merge_sort'

# JM, 09/12/2024
#
# This class builds a Binary Search Tree based off a given array.
class Tree
  attr_reader :root

  def initialize(array)
    @root = build_tree(merge_sort(array.uniq))
  end

  def build_tree(array)
    length = array.length - 1
    mid = length / 2

    # base case
    return nil if length.negative?

    # set root to middle of the array
    # set left node to left subtree
    # set right node to right subtree
    Node.new(
      array[mid],
      build_tree(array[0...mid]),
      build_tree(array[mid + 1..])
    )
  end

  def insert(value, root = @root)
    return value if root.data == value

    # base case: if the "root" is a leaf node
    return root.send(value < root.data ? :left= : :right=, Node.new(value)) if root.left.nil? || root.right.nil?

    insert(value, root.left) if value < root.data
    insert(value, root.right) if value > root.data
  end

  def remove(value, root = @root, parent_node = nil, parent_connection = nil)
    # require 'pry'
    # binding.pry

    return remove(value, root.left, root, :left=) if value < root.data
    return remove(value, root.right, root, :right=) if value > root.data

    if root.left.nil? || root.right.nil?
      parent_node.send(parent_connection, root.left || root.right)
      return value
    end

    new_value = find_next_biggest_value(root)
    remove(new_value)
    root.data = new_value

    value
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def find_next_biggest_value(root)
    root = root.right
    root = root.left until root.left.nil?
    root.data
  end
end
