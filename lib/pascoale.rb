module Pascoale
  def self.root
    File.expand_path("#{File.dirname(__FILE__)}/..")
  end
end

require 'pascoale/version'
require 'pascoale/constants'
require 'pascoale/syllable_separator'
require 'pascoale/reflector'
require 'pascoale/edits'
require 'pascoale/formatter'
require 'pascoale/inflector'
