# desc "Explaining what the task does"
# task :inventorymaster do
#   # Task goes here
# end
require "rake/testtask"

Rake::Inventorymaster.new do |t|
  t.pattern = "test/**/*_test.rb"
end

task default: :test