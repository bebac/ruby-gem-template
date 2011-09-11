require File.dirname(__FILE__)+"/lib/version"

GEMSPEC = Gem::Specification.new do |s|   
  s.name         = 'xxx'
  s.version      = Xxx::VERSION
  s.platform     = Gem::Platform::RUBY
  s.author       = 'Benny Bach'
  s.email        = 'benny.bach@gmail.com'
  s.homepage     = 'http://rake.rubyforge.org'
  s.summary      = ''
  s.description  = ''
  s.files        = Dir.glob('{lib,test}/**/*') + %w[README.md Rakefile]
  s.require_path = 'lib'
end
