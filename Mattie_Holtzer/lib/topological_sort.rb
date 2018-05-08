require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  result = []
  queue = []
  visited_nodes = 0
  remaining_vert = vertices.dup
  while result.length < vertices.length
    # print 'hey'
    # print remaining_vert.map{|vert| vert.in_edges.length}
    # print remaining_vert.map{|vert| vert.value}
    remaining_vert.each do |vert|
      if vert.in_edges.length == 0
        queue.push(vert)
        new_vert = []
        remaining_vert.each do |vert2|
          new_vert.push(vert2) unless vert2 == vert
        end
        remaining_vert = new_vert
      end
    end
    # print 'hi'
    # print queue.map{|queue| queue.out_edges.length}
    return [] if remaining_vert.length>0 && queue.length == 0
    next_vert = queue.shift()
    next_vert.out_edges.each do |edge|
      edge.destroy!
    end
    result.push(next_vert)
    # print result.map{|queue| queue.out_edges.length}
    visited_nodes+=1
  end
  result
end
