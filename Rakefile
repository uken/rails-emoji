#!/usr/bin/env rake
require 'stickler'
require 'stickler/client'

begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
begin
  require 'rdoc/task'
rescue LoadError
  require 'rdoc/rdoc'
  require 'rake/rdoctask'
  RDoc::Task = Rake::RDocTask
end

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'RailsEmoji'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

APP_RAKEFILE = File.expand_path("../test/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'



Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end


task :default => :test

desc 'Builds and pushes the gem'
task :gem => ['gem:build', 'gem:push']

namespace :gem do
  UKEN_GEM_SERVER = "http://gems.uken.com"
  def gemspec_file; Dir["*.gemspec"].first; end
  def gemspec; eval File.read(gemspec_file); end
  def name; gemspec.name; end
  def version; gemspec.version; end
  def version_tag; "v#{version}"; end
  def gemfile; "pkg/#{name}-#{version}.gem"; end
  def escape n; "\e[#{n}m" if $stdout.tty?; end
  def ohai msg; puts "#{escape "1;34"}==>#{escape "1;39"} #{msg}#{escape 0}"; end

  desc "Build #{name}-#{version}.gem into the pkg directory"
  task :build do
    system <<-COMMAND
mkdir -p pkg
gem build #{gemspec_file} -q
mv *.gem pkg
COMMAND
  end

  desc "Create tag #{version_tag} and build and push #{name}-#{version}.gem to Uken gemserver"
  task :push do
    ::Stickler::Client::Push.new([ gemfile, "--server", UKEN_GEM_SERVER ]).run
    system "git tag #{version_tag}"
    ohai "Don't forget to 'git push --tags'"
  end
end

