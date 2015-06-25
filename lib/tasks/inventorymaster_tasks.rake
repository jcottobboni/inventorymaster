require 'rake/testtask'
require 'rails/test_unit/sub_test_task'

task default: :test

desc "Runs all tests in test folder"
task :test do
  Rails::TestTask.test_creator(Rake.application.top_level_tasks).invoke_rake_task
end

namespace :test do
  # ...
  Rails::TestTask.new(:run) do |t|
    t.pattern = "test/**/*_test.rb"
  end
  # ...
end