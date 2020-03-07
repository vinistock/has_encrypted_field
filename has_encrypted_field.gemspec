# frozen_string_literal: true

require_relative "lib/has_encrypted_field/version"

Gem::Specification.new do |spec|
  spec.name          = "has_encrypted_field"
  spec.version       = HasEncryptedField::VERSION
  spec.authors       = ["Vinicius Stock"]
  spec.email         = ["vinicius.stock@shopify.com"]

  spec.summary       = "Encrypted attributes for Rails models."
  spec.description   = "Encrypted attributes for Rails models."
  spec.homepage      = "https://github.com/vinistock/has_encrypted_field"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/vinistock/has_encrypted_field"
  spec.metadata["changelog_uri"] = "https://github.com/vinistock/has_encrypted_field/blob/master/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 5.0.0"

  spec.add_development_dependency "byebug"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-minitest"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "sqlite3"
end
