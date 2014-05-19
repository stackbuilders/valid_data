require "bundler/gem_tasks"
require "rspec/core/rake_task"

# Default directory to look in is `/specs`
# Run with `rake spec`
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'nested']
end

# Default task is running the test suite
task :default => :spec

# This code represents the rake task that will ultimately be exposed by this gem
namespace :db do
  namespace :data do
    task :check, [:padding] => [:environment] do |t, args|
      # padding between columns
      padding = (args[:padding] || 30).to_i

      # load all models
      Rails.application.eager_load!

      # body
      puts ActiveRecord::Base.descendants.reject{ |klass|
        # Ignore Globalize's translation tables
        klass.name.include?("::Translation")
      }.map { |klass, count = 0|
        # Count invalid models
        klass.find_each{ |model| count += 1 if model.invalid? }
        # Format result
        "%s | %s | %s" % [klass.name, count, klass.count].map{ |cell| cell.to_s.ljust(padding) }
      }
    end
  end
end
