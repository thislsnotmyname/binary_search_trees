require_relative 'lib/tree'

arr = Array.new(14) { rand(1..100) }
tree = Tree.new(arr)

tree.pretty_print

puts ''

puts "Insert #{tree.insert(((1..100).to_a - arr).sample)}"

tree.pretty_print

puts ''

puts 'Remove 50:'
tree.remove(50)

tree.pretty_print
