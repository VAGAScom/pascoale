# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pascoale/version'

Gem::Specification.new do |spec|
  spec.name          = 'pascoale'
  spec.version       = Pascoale::VERSION
  spec.authors       = ['Ronie Uliana']
  spec.email         = ['ronie.uliana@vagas.com.br']
  spec.summary       = %q{Text processing utilities}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split('\x0')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', ['~> 1.5', '>= 1.5.1']
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'guard-rspec'
end
