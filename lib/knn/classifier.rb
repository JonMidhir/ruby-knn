module Knn
  class Classifier
    def initialize(vectors, k)
      @vectors = vectors
      @k = k
    end

    def classify(vector)
      nearest_neighbours_to(vector).group_by(&:label).max_by { |_,v| v.size }[0]
    end

    def nearest_neighbours_to(vector, metric = :sq_euclidean)
      if metric == :sq_euclidean
        sq_distances_to(vector)
      else
        distances_to(vector)
      end.sort_by { |_, distance| distance }.take(@k).map(&:first)
    end

    private

    def sq_distances_to(vector)
      # returns [[Vector, distance], ...]
      @vectors.map {|v| [v, v.sq_distance_to(vector)] }
    end

    def distances_to(vector)
      # returns [[Vector, distance], ...]
      @vectors.map {|v| [v, v.distance_to(vector)] }
    end
  end
end
