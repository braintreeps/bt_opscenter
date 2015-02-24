# -*- encoding: utf-8 -*-

$:.push File.expand_path("../lib", __FILE__)
require 'bt_opscenter/version'

Gem::Specification.new do |s|
  s.name = "bt_opscenter"
  s.summary = "Simple wrapper for OpsCenter API with CLI"
  s.description = "Simple wrapper for OpsCenter API with CLI"
  s.version = BtOpscenter::VERSION
  s.license = "MIT"
  s.author = "Braintree"
  s.email = "code@getbraintree.com"
  s.homepage = "http://www.braintreepayments.com/"
  s.has_rdoc = false
  s.files = Dir.glob ["README.md", "LICENSE", "lib/**/*.rb", "*.gemspec"]
  s.add_development_dependency "pry"
  s.add_runtime_dependency "commander"
  s.add_runtime_dependency "faraday"
  s.executables << "bt-opscenter"
end
