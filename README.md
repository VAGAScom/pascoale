# Pascoale

Minor utilities for text processing in Brazilian Portuguese.

I'm going to add new functions as I need them. Currently it has only variations of a word at one and two **edit distances** (Reference: http://norvig.com/spell-correct.html).

The code is kinda slow, but I'm not worried about speed (yet).

## Installation

Add this line to your application's Gemfile:

    gem 'pascoale'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pascoale

## Usage

Variations of a word (typos and misspelling)

```ruby
require 'pascoale'

edits = Pascoale.Edits.new('você')

# 1 edit distance
puts edits.editions.inspect

# 2 edits distance
puts edits.editions2.inspect # LOTS of output, be aware.
```


## Contributing

1. Fork it ( http://github.com/<my-github-username>/pascoale/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
