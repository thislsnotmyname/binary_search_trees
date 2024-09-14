require_relative 'lib/tree'

arr = Array.new(14) { rand(1..100) }
tree = Tree.new(arr)

tree.pretty_print

puts ''

inserted = ((1..100).to_a - arr).sample

puts "Insert #{tree.insert(inserted)}:"

tree.pretty_print

puts ''

remove = (arr << inserted).sample

puts "Remove #{tree.remove(remove)}:"

tree.pretty_print
