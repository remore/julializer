lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'julializer/version'

Gem::Specification.new do |s|
  s.name          = "julializer"
  s.version       = Julializer::VERSION
  s.authors       = ["Kei Sawada(@remore)"]
  s.email         = ["k@swd.cc"]
  s.summary       = %q{A ruby2julia transpiler with only limited types of syntax conversion supported}
  s.description   = s.summary
  s.homepage      = "https://github.com/remore/julializer"
  s.license       = "MIT"
  s.required_ruby_version = '>= 1.9.1'

  s.files         = %w(Rakefile README.md) + Dir.glob("{bin,lib}/**/*", File::FNM_DOTMATCH).reject {|f| File.directory?(f) }
  s.bindir        = 'bin'
  s.executables   = ["julializer"]
  s.test_files    = s.files.grep(%r{^spec\/*.rb})
  s.require_paths = ["lib"]

  s.add_development_dependency "rake"
end
