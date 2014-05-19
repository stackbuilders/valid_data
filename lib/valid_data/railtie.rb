require 'valid_data'
require 'rails'

module ValidData
  class Railtie < Rails::Railtie
    railtie_name :valid_data

    rake_tasks do
      load "tasks/valid_data.rake"
    end
  end
end
