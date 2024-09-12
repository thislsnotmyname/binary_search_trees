def merge_sort(arr)
  length = arr.length
  # if arr is of size 1, it is sorted
  return arr if length <= 1

  # sort the left half
  left = merge_sort(arr[0...length / 2])

  # sort the right half
  right = merge_sort(arr[length / 2..])

  # merge the sorted halves
  merged_arr = []
  merged_arr << left[0] <= right[0] ? left.shift : right.shift until left.empty? || right.empty?

  left + merged_arr + right
end
