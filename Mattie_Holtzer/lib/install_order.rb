# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)
  vertices = []
  arr.each do |tup|
    if vertices.length < [tup[0], tup[1]].max
      [*vertices.length+1..[tup[0], tup[1]].max].each do |val|
        vertices.push(Vertex.new(val))
      end
    end
    Edge.new(vertices[tup[1]-1], vertices[tup[0]-1])
  end
  ret = topological_sort(vertices).map{|vert| vert.value}
  ret
end

def mod_install_order(arr)
  vertices = []
  hash = Hash.new(false)
  arr.each do |tup|
    unless !!hash[tup[0]]
      vertices.push(Vertex.new(tup[0]))
      hash[tup[0]] = vertices.length-1
    end
    unless !!hash[tup[1]]
      vertices.push(Vertex.new(tup[1]))
      hash[tup[1]] = vertices.length-1
    end
    Edge.new(vertices[hash[tup[1]]], vertices[hash[tup[0]]]) unless tup[1].nil?
  end
  ret = topological_sort(vertices).map{|vert| vert.value}
  ret
end

arr = [["mocha", "browserify"], ["bower", "browserify"], ["underscore", "cheerio"],
       ["mocha", "underscore"], ["mocha", "bower"], ["passport", "mocha"],
       ["hapi", "browserify"]]

print mod_install_order(arr)

arr = [["mocha", "browserify"], ["bower", "browserify"], ["underscore", "cheerio"],
       ["mocha", "underscore"], ["mocha", "bower"], ["passport", "mocha"],
       ["hapi", "browserify"], ["browserify", nil], ["cheerio", nil]]

print mod_install_order(arr)
