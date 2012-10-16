# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'

Geoxtory::Application.load_tasks

Rake::Task[:default].prerequisites.clear
task :default => %w(db:drop db:migrate db:seed spec stats)
