desc "Check for invalid records in the database"
task :validate_records, [:padding] => [:environment] do |t, args|
  # load all models
  Rails.application.eager_load!

  ValidData::Runner.new(args[:padding], ActiveRecord::Base).data
end
