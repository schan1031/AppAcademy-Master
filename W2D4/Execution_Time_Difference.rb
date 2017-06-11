

def my_min(arr)
  arr.each do |el1|
    ct = 0
    arr.each do |el2|
      ct += 1 if el1 > el2
    end
    return el1 if ct == 0
  end
end

list = [0, 3, 5, 4, -5, 10, 1, 90]
#p my_min(list)

def my_min_n(arr)
  min = arr.first
  arr.each do |el|
    min = el if el < min
  end
  min
end

#p my_min_n(list)

def my_lcs(arr)
  subs = []
  (0...arr.length).each do |i|
    (0...arr.length - i).each do |j|
      subs << arr[j..j + i]
    end
  end

  subs.map { |s| s.reduce(:+) }.max
end

list = [-5, 3, -7, 5, 4]
#p my_lcs(list)

def my_b_lcs(arr)
  curr_sum, max_sum = arr.first, arr.first
  arr[1..-1].each do |num|
    curr_sum = [num, num + curr_sum].max
    max_sum = [max_sum, curr_sum].max
  end
  max_sum
end

p my_b_lcs(list)
