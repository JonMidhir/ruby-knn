# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "knn/version"

Gem::Specification.new do |spec|
  spec.name          = "knn"
  spec.version       = Knn::VERSION
  spec.authors       = ["John Hope"]
  spec.email         = ["me@jhope.ie"]

  spec.summary       = %q{A simple kNN classifier.}
  spec.homepage      = "https://github.com/jonmidhir/ruby-knn"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.15"
end
