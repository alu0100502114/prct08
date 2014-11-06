#require "bundler/gem_tasks"
#require 'rspec/core/rake_task'

#RSpec::Core::RakeTask.new

#task :default => :spec


require "bundler/gem_tasks"

task :default => :spec

desc 'Ejecutar códigos de ejemplo de RSpec'
task :spec do
  sh 'rspec spec/examen_spec.rb'
end

desc 'Ejecutar ficheros Ruby desde directorio "lib"'
task :bin do
  sh 'ruby -I. lib/Question/pregunta.rb'
  sh 'ruby -I. lib/Question/Simple_Exam/llist.rb'
end
    
desc 'Ejecutar test con --format documentation'
task :test do
  sh 'rspec spec/examen_spec.rb --format documentation'
end

desc 'Ejecutar test con --format html'
task :thtml do
  sh 'rspec spec/examen_spec.rb --format html'
end

desc 'Ejecutar tests de lista enlazada'
task :list do
  sh 'rspec spec/llist_spec.rb'
end
