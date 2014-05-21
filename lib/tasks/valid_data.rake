desc "Check for invalid records in the database"
task :validate_records, [:padding] => [:environment] do |t, args|
  # Load all models
  Rails.application.eager_load!

  # Set padding if not passed in ARGV
  padding = args[:padding] || 30

  # Instantiate the Runner and call #data on it
  ValidData::Runner.new(padding, ActiveRecord::Base).run
end
