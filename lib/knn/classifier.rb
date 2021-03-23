module Knn
  class Classifier
    def initialize(vectors, k, distance_calculator = SquareEuclideanCalculator)
      # Expects vectors in format [label, n1, n2, n3, ...]
      @vectors = vectors
      @k = k
      @distance_calculator = distance_calculator.new
    end

    def classify(vector)
      nearest_neighbours_to(vector).group_by(&:first).max_by { |_,v| v.size }[0]
    end

    def nearest_neighbours_to(vector)
      distances_to(vector).sort_by { |_, distance| distance }.take(@k)
    end

    private

    def distances_to(vector)
      # returns [[Vector, distance], ...]
      @vectors.map do |v| 
        [v[0], @distance_calculator.distance(vector[1..-1], v[1..-1])]
      end
    end
  end
end
