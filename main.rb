require_relative 'lib/tree'

tree = Tree.new(Array.new(15) { rand(1..100) })

tree.pretty_print

puts tree.root
