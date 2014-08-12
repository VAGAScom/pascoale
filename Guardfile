guard :rspec, { all_on_start: true, keep: true, all_after_pass: true, run_all: { cmd: 'rspec -f progress' } } do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
