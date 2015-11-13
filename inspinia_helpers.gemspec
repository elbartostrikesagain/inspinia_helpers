# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'inspinia_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "inspinia_helpers"
  spec.version       = InspiniaHelpers::VERSION
  spec.authors       = ["Calvin Delamere", "Justin Van Eaton"]
  spec.email         = ["calvin.delamere@gmail.com"]

  spec.summary       = %q{Inspinia view helpers}
  spec.description   = %q{This gem provides view helpers which build elements from the Inspinia bootstrap theme. These helpers will keep you code DRY and more readable.}
  spec.homepage      = "https://github.com/elbartostrikesagain/inspinia_helpers"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
