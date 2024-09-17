require 'pp'
require_relative 'node'
require_relative 'merge_sort/merge_sort'

# JM, 09/14/2024
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
    Node.new(array[mid],
             build_tree(array[0...mid]),
             build_tree(array[mid + 1..]))
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil?

    return root if root.data == value

    root.left = insert(value, root.left) if value < root.data
    root.right = insert(value, root.right) if value > root.data

    root
  end

  def remove(value, root = @root, parent_node = nil, parent_connection = nil)
    return unless root

    return remove(value, root.left, root, :left=) if value < root.data
    return remove(value, root.right, root, :right=) if value > root.data

    if root.left && root.right
      root.data = remove(find_next_biggest_value(root), root)
    else
      parent_node.send(parent_connection, root.left || root.right)
    end
    value
  end

  def find(value, root = @root)
    return if root.nil?

    return find(value, root.left) if value < root.data
    return find(value, root.right) if value > root.data

    root
  end

  def level_order(root = @root)
    # Iterative approach
    queue = [root]
    array = []
    until queue.empty?
      curr = queue.shift
      queue << curr.left if curr.left
      queue << curr.right if curr.right
      array << curr.data
      yield(curr) if block_given?
    end
    array
  end

  def level_order_recursive(root = @root, queue = [root], arr = [], &block)
    # Recursive approach
    return if root.nil?

    curr = queue.shift
    queue << curr.left if curr.left
    queue << curr.right if curr.right
    arr << curr.data

    block.call(curr) if block_given?

    level_order_recursive(root.left, queue, arr, &block)
    level_order_recursive(root.right, queue, arr, &block)

    arr
  end

  def inorder(root = @root, arr = [], &block)
    return if root.nil?

    inorder(root.left, arr, &block)
    arr << root.data
    block.call root if block_given?
    inorder(root.right, arr, &block)

    arr
  end

  def preorder(root = @root, arr = [], &block)
    return if root.nil?

    arr << root.data
    block.call root if block_given?
    inorder(root.left, arr, &block)
    inorder(root.right, arr, &block)

    arr
  end

  def postorder(root = @root, arr = [], &block)
    return if root.nil?

    inorder(root.left, arr, &block)
    inorder(root.right, arr, &block)
    arr << root.data
    block.call root if block_given?

    arr
  end

  def height(node)
    return -1 if node.nil?

    [height(node.left), height(node.right)].max + 1
  end

  def depth(node, root = @root)
    return 0 if root == node

    return depth(node, root.left) + 1 if node.data < root.data

    depth(node, root.right) + 1 if node.data > root.data
  end

  def balanced?
    level_order { |node| return false unless (height(node.left) - height(node.right)).between?(-1, 1) }
    true
  end

  def rebalance
    @root = build_tree(inorder(@root))
  end

  def pretty_print(pp, node = @root, prefix = '', is_left = true)
    pretty_print(pp, node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    pp.text "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}\n"
    pretty_print(pp, node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def find_next_biggest_value(root)
    root = root.right
    root = root.left until root.left.nil?
    root.data
  end
end
