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

Vectors consist of a set of co-ordinates and a label. The array of co-ordinates, representing features, can be any length but when comparing vectors the lengths must match.

The Euclidian distance between two vectors can be calculated like so:

```ruby
vector1 = Knn::Vector.new([1,2], nil)
vector2 = Knn::Vector.new([0,0], nil)

vector1.distance_to(vector2)
#> 2.23606797749979
```

The distance is always a positive floating-point number.

### Classifier

The `Knn::Classifier` takes an array of Vectors (of the same length), representing the training data, and a value for _k_, the number of neighbours used to classify a data point.

```ruby
vectors = [
  Knn::Vector.new([1,2], 'apple'),
  Knn::Vector.new([5,5], 'orange'),
  Knn::Vector.new([0,2], 'apple'),
  Knn::Vector.new([7,5], 'orange'),
  Knn::Vector.new([1,1], 'apple'),
  Knn::Vector.new([6,5], 'orange')
] # ...

classifier = Knn::Classifier.new(vectors, 3)

new_datapoint = Knn::Vector.new([2,2], nil)

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
