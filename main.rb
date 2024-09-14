require_relative 'lib/tree'

arr = Array.new(14) { rand(1..100) }
tree = Tree.new(arr)

tree.pretty_print

puts ''

inserted = ((1..100).to_a - arr).sample
arr << inserted

puts "Insert #{tree.insert(inserted)}:"

tree.pretty_print

puts ''

remove = arr.sample

puts "Remove #{tree.remove(remove)}:"
arr.delete(remove)

tree.pretty_print

find = arr.sample

puts "Find #{find}: #{tree.find(find)}"

print 'Level order: '
p tree.level_order

print 'Preorder: '
p tree.preorder

print 'Postorder: '
p tree.postorder

print 'Inorder: '
p tree.inorder

puts "Height of root: #{tree.height(tree.root)}"

puts "Depth of #{tree.level_order.last}: #{tree.depth(tree.find(tree.level_order.last))}"
puts "Depth of #{tree.root.right}: #{tree.depth(tree.root.right)}"

puts 'Unbalance!'

3.times { tree.insert(rand(101..150)) }

tree.pretty_print

puts "Balanced? #{tree.balanced?}"

puts 'Rebalance!'
tree.rebalance

tree.pretty_print

puts "Balanced? #{tree.balanced?}"
