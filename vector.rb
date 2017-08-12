require 'forwardable'

class Vector
  extend Forwardable

  attr_reader :label

  def initialize(coordinates, label)
    @coordinates = coordinates
    @label = label
  end

  def_delegators :@coordinates, :[], :size

  def distance_to(vector)
    Math.sqrt(
      @coordinates.each_with_index.inject(0) do |acc, (coordinate, index)|
        feature_distance = (coordinate - vector[index])**2
        acc + feature_distance
      end
    )
  end
end
