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

puts "Find #{find}: #{tree.find(find).inspect}"

# p tree.level_order

p(tree.postorder { |node| puts node })
