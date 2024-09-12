# JM, 09/12/2024
#
# This class creates nodes for a binary search tree.
class Node
  attr_reader :data, :left, :right

  include Comparable

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other)
    data <=> other.data
  end

  def to_s
    data.to_s
  end
end
