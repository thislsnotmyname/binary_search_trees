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
  length.times do
    break merged_arr += right if left.empty?
    break merged_arr += left if right.empty?

    next merged_arr << left.shift if left[0] <= right[0]
    next merged_arr << right.shift if left[0] >= right[0]
  end

  merged_arr
end
