specs = [
	"spec/core/random/rand_spec.rb",
	"spec/core/array/slice_spec.rb",
	"spec/core/math/atan2_spec.rb",
	"spec/core/math/atan_spec.rb",
	"spec/core/math/asinh_spec.rb",
	"spec/core/math/asin_spec.rb",
	"spec/core/math/acosh_spec.rb",
	"spec/core/math/acos_spec.rb",
	"spec/core/integer/",
	"spec/core/float/",
	"spec/core/fixnum/",
	"spec/core/false/",
]

desc 'test behaviour using RSpec test files located in spec/*'
task :spec do
  specs.each {|e| system("rspec #{e}")}
end

desc 'test behaviour using RSpec test files located in spec/* with JULIALIZE_DEBUG set to true'
task :spec_debug do
  specs.each {|e| system("JULIALIZE_DEBUG=true rspec #{e}") }
end
