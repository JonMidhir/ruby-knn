class KnnClassifier
  def initialize(vectors, k)
    @vectors = vectors
    @k = k
  end

  def classify(vector)
    nearest_neighbours_to(vector).group_by(&:label).max_by { |_,v| v.size }[0]
  end

  def nearest_neighbours_to(vector)
    distances_to(vector).sort_by { |_, distance| distance }.take(@k).map(&:first)
  end

  private

  def distances_to(vector)
    # returns [[Vector, distance], ...]
    @vectors.map {|v| [v, v.distance_to(vector)] }
  end
end

