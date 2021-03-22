require 'forwardable'

module Knn
  class Vector
    extend Forwardable

    attr_reader :label

    def initialize(coordinates, label)
      @coordinates = coordinates
      @label = label
    end

    def_delegators :@coordinates, :[], :size

    def sq_distance_to(vector)
      @coordinates.each_with_index.map do |coordinate, index|
        cartesian_distance = (coordinate - vector[index])
        cartesian_distance * cartesian_distance
      end.sum
    end

    def distance_to(vector)
      Math.sqrt(sq_distance_to(vector))
    end
  end
end
