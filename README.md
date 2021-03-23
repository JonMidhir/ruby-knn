# ruby-knn
Simple kNN Classifier written in Ruby

![Screenshot](https://github.com/JonMidhir/ruby-knn/blob/master/example/screenshot.png?raw=true)

## Usage

Bundle the gem in your project and follow the instructions below.

```ruby
# Gemfile
gem 'knn', git: 'git@github.com:jonmidhir/ruby-knn.git'

# Elsewhere
require 'knn'
```

Or you can start messing about right away by cloning this project and running

```shell
./bin/console
```

### Vector

Vectors are arrays of components, representing features,  where the first element is a label. An example looks like:

```ruby
['vegetable', 0, 1, 0, 1, 0, 0, 0]
```

### Calculating distance between vectors

Distance Calculators can be used to determine the distance between two vectors according to different algorithms. The vectors can be any length but when comparing two the lengths must match.

The Squared Euclidean distance between two vectors can be calculated like so:

```ruby
vector1 = [nil, 1, 2]
vector2 = [nil, 0, 0]

SquaredEuclideanCalculator.new.distance(vector1, vector2)
#> 2.23606797749979
```

The distance is always a positive, floating-point number.

### Classifier

The `Knn::Classifier` takes an array of vectors (of the same length), representing the training data, a value for _k_, the number of neighbours used to classify a data point, and an optional distance calculator class.

By default, the squared Euclidean distance is used because this produces the
same accuracy as Euclidean without requiring the expensive square root calculation.

```ruby
vectors = [
  ['apple', 1, 2],
  ['orange', 5, 5],
  ['apple', 0, 2],
  ['orange', 7, 5],
  ['apple', 1, 1],
  ['orange', 6, 5]
] # ...

classifier = Knn::Classifier.new(vectors, 3, distance_calculator = SquaredEuclideanCalculator)

new_datapoint = [nil, 2,2]

classifier.classify(new_datapoint)
#> 'apple'
```

If you wish you can inspect the nearest neighbours that produced this result:

```ruby
classifier.nearest_neighbours_to(new_datapoint)
```


## Handwriting Example

As mentioned vectors of any size can be used and the example provided in `/examples` is taken from Machine Learning in Action by [@pbharrin](https://github.com/pbharrin) (https://github.com/pbharrin/machinelearninginaction).

To run the entire test on the 946 examples takes around 15 minutes on a decent machine:

```shell
./example/bin/test
```

You can also start the console, which loads the environment and provides you with a 'pre-trained' variable `@knn_classifier` to test individual characters against.

```shell
./example/bin/console
```
