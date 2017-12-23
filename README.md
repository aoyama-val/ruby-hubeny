# Hubeny

Calculate the distance of two latitudes and longitudes using Hubeny's formula.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hubeny'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hubeny

## Usage

```ruby
require "hubeny"

# Calculate distance using Hubeny's formula:
puts Hubeny.distance(35.65500, 139.74472, 36.10056, 140.09111)      #=> 58502.458931819616 (in meters)

# Calculate distance using Haversine formula:
puts Hubeny.haversine(35.65500, 139.74472, 36.10056, 140.09111)     #=> 58619.80584901641 (in meters)
```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

