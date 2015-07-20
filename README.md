# Pascoale

Minor utilities for text processing in **Brazilian Portuguese**.

I'm going to add new functions as I need them.

Currently it has:
- Pluralization and singularization (>= v0.3.0);
- Proparoxytone, paroxytone and oxytone detection (>= v0.3.0); 
- Simple formatting considering accents in portuguese (upcase, downcase, capitalize);
- Title formatting, considering prepositions and other others downcase;
- Variations of a word at one and two **edit distances** (Reference: http://norvig.com/spell-correct.html);
- Heuristic syllabic separation. My tests against a corpus of ~170K words shows 99.36% of correctness (improved to ~99.56% on v0.3.0).

The name of the gem is a homage to "Prof. Pasquale Cipro Neto" (http://pt.wikipedia.org/wiki/Pasquale_Cipro_Neto), a great teacher! And yes, the name of the gem is wrong spelled as a joke ^_^

## Installation

Add this line to your application's Gemfile:

    gem 'pascoale'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pascoale

## Usage

Pluralization and singularization

*(Lowercase only)


```ruby
require 'pascoale'

capt = Pascoale::Inflector.new('capitão')
puts capt.pluralize # => capitães

capts = Pascoale::Inflector.new('capitães')
puts capts.singularize # => capitão

captn = Pascoale::Inflector.new('capitãozinho')
puts captn.singularize # => capitãezinhos

qq = Pascoale::Inflector.new('qualquer')
puts qq.singularize # => quaisquer
```

Proparoxytones, Paroxytones and Oxytones

*(Lowercase only)

```ruby
require 'pascoale'

diox = Pascoale::Reflector.new('dióxido')
puts diox.proparoxytone? # => true
puts diox.paroxytone?    # => false
puts diox.oxytone?       # => false

ideia = Pascoale::Reflector.new('ideia')
puts ideia.proparoxytone? # => false
puts ideia.paroxytone?    # => true
puts ideia.oxytone?       # => false

parati = Pascoale::Reflector.new('parati')
puts parati.proparoxytone? # => false
puts parati.paroxytone?    # => false
puts parati.oxytone?       # => true
```


Text formatter

```ruby
require 'pascoale'

text = Pascoale::Formatter.new('Isso é um teste de formatação')

# Basic formatting
puts text.upcase # => ISSO É UM TESTE DE FORMATAÇÃO
puts text.downcase # => isso é um teste de formatação
puts text.capitalize # => Isso é um teste de formatação

# Fancy formatting (good for titles)
puts text.as_title # => Isso É um Teste de Formatação

# Predicates
puts text.upcase.upcase? # => true
puts text.upcase.downcase? # => false
puts text.capitalize? # => true
```

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
*(Lowercase only)

```ruby
require 'pascoale'

separator = Pascoale::SyllableSeparator.new('exceção')
puts separator.separated.inspect # => ["ex", "ce", "ção"]

separator = Pascoale::SyllableSeparator.new('aéreo')
puts separator.separated.inspect # => ["a", "é", "re", "o"]

separator = Pascoale::SyllableSeparator.new('apneia')
puts separator.separated.inspect # => ["ap", "nei", "a"]

separator = Pascoale::SyllableSeparator.new('construir')
puts separator.separated.inspect # => ["cons", "tru", "ir"]
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/pascoale/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
