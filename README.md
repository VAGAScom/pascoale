# Pascoale

Minor utilities for text processing in **Brazilian Portuguese**.

I'm going to add new functions as I need them.

Currently it has:
- variations of a word at one and two **edit distances** (Reference: http://norvig.com/spell-correct.html).
- Syllabic separation. My tests against a corpus of ~170K words shows 99.36% of correctness \o/.

The code is kinda slow, but I'm not worried about speed (yet).

The name of the gem is a homage to "Prof. Pasquale Cipro Neto" (http://pt.wikipedia.org/wiki/Pasquale\_Cipro\_Neto), a great teacher! And yes, the name of the gem is wrong spelled as a joke ^_^

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

edits = Pascoale::Edits.new('você')

# 1 edit distance
puts edits.editions.inspect

# 2 edits distance
puts edits.editions2.inspect # LOTS of output, beware.
```

Syllabic separation

```ruby
require 'pascoale'

separator = Pascoale::SyllableSeparator.new('exceção')
puts separator.separated.inspect # ["ex", "ce", "cão"]

separator = Pascoale::SyllableSeparator.new('aéreo')
puts separator.separated.inspect # ["a", "é", "re", "o"]

separator = Pascoale::SyllableSeparator.new('apneia')
puts separator.separated.inspect # ["ap", "nei", "a"]

separator = Pascoale::SyllableSeparator.new('construir')
puts separator.separated.inspect # ["cons", "tru", "ir"]

# Known error :( :( :(
separator = Pascoale::SyllableSeparator.new('traidor')
puts separator.separated.inspect # ["tra", "i", "dor"] should be ["trai", "dor"]

```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/pascoale/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
