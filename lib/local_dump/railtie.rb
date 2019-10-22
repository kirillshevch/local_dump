require 'local_dump'
require 'rails'

module LocalDump
  class Railtie < Rails::Railtie
    railtie_name :local_dump

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/tasks/**/*.rake").each { |f| load f }
    end
  end
end
