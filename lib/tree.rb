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

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
