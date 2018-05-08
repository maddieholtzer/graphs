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

  def delete_in(edge)
    new_in = []
    @in_edges.each do |edge2|
      new_in.push(edge) unless edge2 == edge
    end
    @in_edges = new_in
  end

  def delete_out(edge)
    new_out = []
    @out_edges.each do |edge2|
      new_out.push(edge) unless edge2 == edge
    end
    @out_edges = new_out
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
    @to_vertex.delete_in(self)
    @from_vertex.delete_out(self)
    @from_vertex = nil
    @to_vertex = nil
  end
end
