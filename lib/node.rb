# JM, 09/12/2024
#
# This class ...
class Node
  attr_reader :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end
end
