class Vertex

  attr_reader :value, :in_edges, :out_edges

  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end

  def add_in(edge)
    @in_edges.push(edge)
  end

  def add_out(edge)
    @out_edges.push(edge)
  end

end

class Edge

  attr_reader :from_vertex, :to_vertex, :cost

  def initialize(from_vertex, to_vertex, cost = 1)
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    @cost = cost
    @to_vertex.add_in(self)
    @from_vertex.add_out(self)
  end

  def destroy!

  end
end
