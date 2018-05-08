class Vertex

  attr_reader :value, :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge

  attr_reader :in_edges

  def initialize(from_vertex, to_vertex, cost = 1)
    @in_edges = []
  end

  def destroy!

  end
end
