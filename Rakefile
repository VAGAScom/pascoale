require 'bundler/gem_tasks'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  task :default => [:spec, :build]
rescue LoadError
end

desc 'Run benchmark against corpus'
task :benchmark do
  `ruby -I lib lib/pascoale/syllable_separator_benchmark.rb`
end