def first_anagram?(string, anagram)
  arr = string.chars.permutation.to_a
  arr.map(&:join).include?(anagram)
end
# Permutations N!
# Mapping Join (N) * N Factorial Permutations

def second_anagram?(string, anagram)
  until string.empty? || anagram.empty?
    l = string[0]
    if anagram.include?(l)
      anagram.sub!(l, '')
      string.sub!(l, '')
    else
      return false
    end
  end
  true
end
# N repetitions worst case, each has an O(N) search to delete
# Total N^2

def third_anagram?(string, anagram)
  string.chars.sort.join == anagram.chars.sort.join
end
# Chars and join? Constant or N
# Sort is quicksort, N^2 at worst compare is constant
# Faster on average than second anagram

def fourth_anagram?(string, anagram)
  h1, h2 = Hash.new(0), Hash.new(0)
  string.chars.each do |l|
    h1[l] += 1
  end

  anagram.chars.each do |l|
    h2[l] += 1
  end

  h1.values == h2.values
end
# Iterating through N two times, 2N ~ N

def fifth_anagram?(string, anagram)
  h1 = Hash.new(0)
  string.chars.each do |l|
    h1[l] += 1
  end

  anagram.chars.each do |l|
    h1[l] -= 1
  end

  h1.values.all? { |val| val == 0 }
end
# Same Time Complexity as Fourth, but stores one less hash

p fifth_anagram?('and', 'dna')
p fifth_anagram?('not', 'anagrams')
