def naive_wr(arr, ws)
  cur_max = 0
  (0..arr.length - ws).each do |idx|
    window = arr[ idx...idx + ws ]
    max = window.max
    min = window.min
    if cur_max < (max - min)
      cur_max = max - min
    end
  end
  cur_max
end
# Passes N in each, for each window, runs O(2N) for max,min
# Runs O(N^2)

arr = [1, 0, 2, 5, 4, 8]
# p naive_wr(arr, 3)
