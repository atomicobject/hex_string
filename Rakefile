require "bundler"
require "rake/testtask"
require "rake/clean"
require "yard"
Bundler::GemHelper.install_tasks

Rake::TestTask.new do |t|
  t.test_files = FileList["test/test*.rb"]
end

YARD::Rake::YardocTask.new do |t|
  t.files = %w[ lib/hex_string.rb ]
end

CLEAN.include "pkg"
CLEAN.include "doc"
CLEAN.include ".yardoc"

task :default => :test
