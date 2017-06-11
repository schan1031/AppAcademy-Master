def bad_two_sum?(arr, target)
  arr.each_index do |i|
    arr.each_index do |j|
      next if i == j
      return true if arr[i] + arr[j] == target
    end
  end
  false
end
# N^2, runs through each element for each element
# One Comparison

def okay_two_sum?(arr, target)
  arr = arr.sort
  arr.each_index do |i|
    to_find = target - arr[i]
    sub_arr = arr[0...i] + arr[i + 1..-1]
    return true if sub_arr.bsearch { |x| x == to_find }
  end
  false
end
# Sort is n log n, ideally we would write merge sort to avoid worst case
# On sorted array, call bsearch (logn) for each target - num (N)
# nlogn + nlogn


def two_sum?(arr, target)
  h = Hash.new
  arr.each_with_index do |val, i|
    h[val] = i
  end

  arr.each_index do |i|
    to_find = target - arr[i]
    return true if h[to_find] && h[to_find] != i
  end
  false
end
# O(N) to write hash + O(N) to check keys
