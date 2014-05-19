namespace :valid_data do
  namespace :db do
    namespace :data do
      task :check, [:padding] => [:environment] do |t, args|
        # padding between columns
        padding = (args[:padding] || 30).to_i

        # load all models
        Rails.application.eager_load!

        # header
        puts "%s | %s | %s" % ["Model", "Invalid", "Total"].map{|s| s.ljust(padding) }
        puts "-" * 3 * padding

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
end
