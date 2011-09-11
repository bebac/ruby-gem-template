require 'rubygems/package_task'
require 'rake/testtask'
require 'rake/clean'

load 'xxx.gemspec'
Gem::PackageTask.new(GEMSPEC) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

Rake::TestTask.new do |test|
  test.test_files = Dir['test/**/test_*.rb']
end

CLOBBER.include('**/*.rbc')

task :default => [ :test ]
