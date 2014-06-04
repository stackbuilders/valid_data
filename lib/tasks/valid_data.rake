desc "Check for invalid records in the database"
task :validate_records, [:padding, :num_of_processes] => [:environment] do |t, args|
  # Load all models
  Rails.application.eager_load!

  # Set padding if not passed in ARGV
  padding = args[:padding] || 30

  if args[:num_of_processes]
    runner = ValidData::ParallelRunner.new(padding, ActiveRecord::Base) do |_|
      ActiveRecord::Base.establish_connection(Rails.application.config.database_configuration[Rails.env])
    end
    runner.run(args[:num_of_processes])
  else
    # Instantiate the Runner and call #data on it
    ValidData::Runner.new(padding, ActiveRecord::Base).run
  end
end
