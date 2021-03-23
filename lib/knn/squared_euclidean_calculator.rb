module Knn
  class SquaredEuclideanCalculator
    def distance(v1, v2)
      v1.each_with_index.map do |component, index|
        cartesian_distance = (component - v2[index])
        cartesian_distance * cartesian_distance
      end.sum
    end
  end
end
