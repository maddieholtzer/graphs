# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'

def install_order(arr)
  hash = Hash.new { |h, k| h[k] = [] }
  min = arr[0][0]
  max = arr[0][1]
  arr.each do |tup|
    min = tup[0] if tup[0]<min
    min = tup[1] if tup[1] <min
    max = tup[0] if tup[0] > max
    max = tup[1] if tup[1] > max
    hash[tup[0]].push(tup[1])
  end
  [*min..max]

end
