require_relative 'lib/tree'

arr = Array.new(14) { rand(1..100) }
tree = Tree.new(arr)

pp tree

puts ''

inserted = ((1..100).to_a - arr).sample
arr << inserted

puts "Insert #{inserted}:"
tree.insert(inserted)

pp tree

puts ''

remove = arr.sample

puts "Remove #{tree.remove(remove)}:"
arr.delete(remove)

pp tree

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

puts "Balanced? #{tree.balanced?}"

puts "Height of root: #{tree.height(tree.root)}"

puts "Depth of #{tree.level_order.last}: #{tree.depth(tree.find(tree.level_order.last))}"
puts "Depth of #{tree.root.right}: #{tree.depth(tree.root.right)}"
puts "Depth of #{tree.root}: #{tree.depth(tree.root)}"

puts 'Unbalance!'

3.times { tree.insert(rand(101..150)) }

pp tree

puts "Balanced? #{tree.balanced?}"

puts 'Rebalance!'
tree.rebalance

pp tree

puts "Balanced? #{tree.balanced?}"

print 'Level order: '
p tree.level_order

print 'Preorder: '
p tree.preorder

print 'Postorder: '
p tree.postorder

print 'Inorder: '
p tree.inorder
