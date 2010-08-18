require 'rake'
require 'rake/rdoctask'

desc 'Default: execute specs'
task :default => :spec

desc 'Execute specs'
task :spec do
  exec('rspec spec')
end

desc 'Generate documentation'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Facebooker2'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
