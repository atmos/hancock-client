require File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment')
require 'rake/gempackagetask'
require 'rubygems/specification'
require 'date'
require 'spec/rake/spectask'
require 'cucumber/rake/task'
require 'bundler'

GEM = "hancock-client"
GEM_VERSION = "0.0.9"
AUTHOR = "Corey Donohoe"
EMAIL = ['atmos@atmos.org', 'tim@spork.in']
HOMEPAGE = "http://github.com/atmos/hancock-client"
SUMMARY = "Hancock SSO rack middleware written in sinatra"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE

  manifest = Bundler::Environment.load(File.dirname(__FILE__) + '/Gemfile')
  manifest.dependencies.each do |d|
    next unless d.only && d.only.include?('release')
    s.add_dependency(d.name, d.version)
  end

  s.require_path = 'lib'
  s.autorequire = GEM
  s.files = %w(LICENSE README.md Rakefile) + Dir.glob("{lib,spec}/**/*")
end

task :default => :spec

desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = %w(-fs --color)
end


Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION}}
end

desc "create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

Cucumber::Rake::Task.new(:features) do |t|
  t.libs << 'lib'
  t.cucumber_opts = "--format pretty"
  t.rcov = true
  t.rcov_opts << '--text-summary'
  t.rcov_opts << '--sort' << 'coverage' << '--sort-reverse'
  t.rcov_opts << '--exclude' << '.gem/,spec,examples'
end

task :example do |t|
  rackup_pid = fork
  if rackup_pid.nil?
    Dir.chdir(File.join(File.dirname(__FILE__), 'examples', 'dragon')) do
      exec("../../bin/rackup", "config.ru", "-p", "4567")
    end
  else
    sleep 2
    fork do
      exec("bin/rake", "features")
    end
    Process.wait
    Process.kill("INT", rackup_pid)
  end
end
