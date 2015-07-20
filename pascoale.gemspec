# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pascoale/version'

Gem::Specification.new do |spec|
  spec.name          = 'pascoale'
  spec.version       = Pascoale::VERSION
  spec.authors       = ['Ronie Uliana']
  spec.email         = ['ronie.uliana@vagas.com.br']
  spec.summary       = %q{Text processing utilities for Brazilian Portuguese}
  spec.homepage      = 'http://github.com/ruliana/pascoale'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard-rspec', '~> 4'
  spec.add_development_dependency 'simplecov', '~> 0', '>= 0.9'
end
